/*
Vaibhav Ramachandran
2-Way Set Associative Data Cache Block
ramachav@purdue.edu
Section 3
*/

`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

module dcache
(
	input CLK, nRST,
	datapath_cache_if dcif,
	caches_if.dcache cif
);

import cpu_types_pkg::*;

typedef struct packed
{
	//Left Set Cache Registers
	logic [25:0] left_tag_bits;
	logic left_valid, left_dirty;
	word_t left_word1, left_word2;

	//Right Set Cache Registers	
	logic [25:0] right_tag_bits;
	logic right_valid, right_dirty;
	word_t right_word1, right_word2;

} dcache_t;

//Struct for the 8 cache set entries
dcache_t cache_entry [7:0];
//Struct for the nextstate cache entry
dcache_t nextstate_cache_entry;
//Struct for the snooped cache entry
dcache_t snoop_cache_entry;
//Incoming address struct for the dcache
dcachef_t dcache_addr;
//Incoming address struct for the dcache from the memory controller
dcachef_t snoop_addr;
//32-bit hit counter registers
word_t hit_count, nextstate_hit_count;
//Not Recently Used arrays to tell the cache controller what block to replace
logic [7:0] nru, nextstate_nru;
//5-bit frame counter registers
logic [4:0] frame, next_frame;
//Variable to determine if a cache miss occurred
logic cache_miss;
//Variable to determine if the entry that was snooped needs to be written back to memory
logic dirty_snoop;
//Link register and success value variables for the LL/SC instructions (Link address: [31:0], Valid bit: [32])
logic [32:0] link_register, nextstate_link_register;
//State machine for the cache controller: 13 states, names are self-explanatory 
//LOAD_FROM_MEM, WRITE_TO_MEM and INVALIDATE need 2 states to read/write each of the 2 words in the block from/to memory
typedef enum logic [3:0] {IDLE, LOAD_FROM_MEM1, LOAD_FROM_MEM2, WRITE_TO_MEM1, WRITE_TO_MEM2, INVALIDATE_CONTROL, INVALIDATE1, INVALIDATE2, HALT, CHECK_SNOOP_TARGET, SHARE_WITH_CACHE1, SHARE_WITH_CACHE2, INVALIDATE_SHARED} cache_controller;
//Cache controller variables
cache_controller cache_state, cache_nextstate;

//Assigning the appropriate bits of the incoming address to the appropriate registers for ease of use
assign dcache_addr = dcif.dmemaddr; //Tag Bits: [31:6], Index Bits: [5:3], Block Offset: [2], Byte Offset: [1:0]
assign snoop_addr = cif.ccsnoopaddr; //Tag Bits: [31:6], Index Bits: [5:3], Block Offset: [2], Byte Offset: [1:0]

always_ff @ (posedge CLK, negedge nRST) begin
	if(~nRST) begin
		//Initializing the cache block to all zeros
		cache_entry <= '{default:'0};
		//Initializing the cache controller to IDLE and the nru and frame registers to zero
		frame <= '0;
		nru <= '0;
		cache_state <= IDLE;
		hit_count <= '0;
		//Initializing the link register to zeros
		link_register <= '0;
	end
	else begin
		//Setting the appropriate cache frame to it's nextstate value/snooped value
		cache_entry[dcache_addr.idx] <= nextstate_cache_entry;
		if(cache_state == CHECK_SNOOP_TARGET || cache_state == SHARE_WITH_CACHE1 || cache_state == SHARE_WITH_CACHE2 || cache_state == INVALIDATE_SHARED)
			cache_entry[snoop_addr.idx] <= snoop_cache_entry;
		//Setting the cache controller to it's appropriate nextstate and the nru and frame registers to their nextstates
		frame <= next_frame;
		nru <= nextstate_nru;
		cache_state <= cache_nextstate;
		hit_count <= nextstate_hit_count;
		//Setting the link register and it's valid bit to the appropriate nextstate
		link_register <= nextstate_link_register;
	end
end

//Combinational block for the cache controller and all the logic in each state
always_comb begin
	cache_nextstate = cache_state;
	nextstate_nru = nru;
	
	nextstate_cache_entry = cache_entry[dcache_addr.idx];
	snoop_cache_entry = cache_entry[snoop_addr.idx];
	next_frame = frame;
	nextstate_hit_count = hit_count;
	nextstate_link_register = link_register;
	cache_miss = 0;
	dirty_snoop = 0;
	dcif.dhit = 0;
	dcif.dmemload = '0;
	dcif.flushed = 0;
	cif.dREN = 0;
	cif.dWEN = 0;
	cif.daddr = '0;
	cif.dstore = '0;
	cif.ccwrite = dcif.dmemWEN;
	cif.cctrans = 0;

	case(cache_state)
		IDLE: begin
			if(dcif.halt) 
				cache_nextstate = INVALIDATE_CONTROL;
			else if(dcif.dmemREN) begin
				nextstate_link_register = dcif.datomic? {1'b1, dcif.dmemaddr} : link_register;
				if(dcache_addr.tag == cache_entry[dcache_addr.idx].left_tag_bits && cache_entry[dcache_addr.idx].left_valid) begin
					dcif.dhit = 1;
					dcif.dmemload = dcache_addr.blkoff? cache_entry[dcache_addr.idx].left_word2 : cache_entry[dcache_addr.idx].left_word1;
					nextstate_nru[dcache_addr.idx] = 1;
					nextstate_hit_count = hit_count + 1;
				end
				else if(dcache_addr.tag == cache_entry[dcache_addr.idx].right_tag_bits && cache_entry[dcache_addr.idx].right_valid) begin
					dcif.dhit = 1;
					dcif.dmemload = dcache_addr.blkoff? cache_entry[dcache_addr.idx].right_word2 : cache_entry[dcache_addr.idx].right_word1;
					nextstate_nru[dcache_addr.idx] = 0;
					nextstate_hit_count = hit_count + 1;
				end
				else begin
					cache_miss = 1;
					nextstate_hit_count = hit_count - 1;
					if(nextstate_nru[dcache_addr.idx]) begin
						nextstate_cache_entry.right_valid = 1;
						nextstate_cache_entry.right_dirty = 0;
					end
					else begin
						nextstate_cache_entry.left_valid = 1;
						nextstate_cache_entry.left_dirty = 0;
					end
				end
			end
			else if(dcif.dmemWEN) begin
				dcif.dmemload = (dcif.datomic && (link_register == {1'b1, dcif.dmemaddr}));
				if(dcif.datomic) begin
					if(link_register == {1'b1, dcif.dmemaddr}) begin
						if(dcache_addr.tag == cache_entry[dcache_addr.idx].left_tag_bits) begin
							if(~cache_entry[dcache_addr.idx].left_dirty && cache_entry[dcache_addr.idx].left_valid) begin
								cache_miss = 1;
								nextstate_cache_entry.left_dirty = 1;
								nextstate_nru[dcache_addr.idx] = 0;
							end
							else begin
								nextstate_link_register = '0;
								dcif.dhit = 1;
								nextstate_cache_entry.left_dirty = 1;
								nextstate_nru[dcache_addr.idx] = 1;
								nextstate_hit_count = hit_count + 1;
								if(dcache_addr.blkoff)
									nextstate_cache_entry.left_word2 = dcif.dmemstore;
								else
									nextstate_cache_entry.left_word1 = dcif.dmemstore;
							end
						end
						else if(dcache_addr.tag == cache_entry[dcache_addr.idx].right_tag_bits) begin
							if(~cache_entry[dcache_addr.idx].right_dirty && cache_entry[dcache_addr.idx].right_valid) begin
								cache_miss = 1;
								nextstate_cache_entry.right_dirty = 1;
								nextstate_nru[dcache_addr.idx] = 1;
							end
							else begin
								nextstate_link_register = '0;
								dcif.dhit = 1;
								nextstate_cache_entry.right_dirty = 1;
								nextstate_nru[dcache_addr.idx] = 0;
								nextstate_hit_count = hit_count + 1;
								if(dcache_addr.blkoff)
									nextstate_cache_entry.right_word2 = dcif.dmemstore;
								else
									nextstate_cache_entry.right_word1 = dcif.dmemstore;
							end
						end
						else begin
							cache_miss = 1;
							nextstate_hit_count = hit_count - 1;
							if(nextstate_nru[dcache_addr.idx]) begin
								nextstate_cache_entry.right_valid = 1;
								nextstate_cache_entry.right_dirty = 0;
							end
							else begin
								nextstate_cache_entry.left_valid = 1;
								nextstate_cache_entry.left_dirty = 0;
							end
						end
					end
					else
						dcif.dhit = 1;
				end
				else begin
					if(link_register[31:0] == dcif.dmemaddr)
						nextstate_link_register = '0;
					if(dcache_addr.tag == cache_entry[dcache_addr.idx].left_tag_bits) begin
						if(~cache_entry[dcache_addr.idx].left_dirty && cache_entry[dcache_addr.idx].left_valid) begin
							cache_miss = 1;
							nextstate_cache_entry.left_dirty = 1;
							nextstate_nru[dcache_addr.idx] = 0;
						end
						else begin
							dcif.dhit = 1;
							nextstate_cache_entry.left_dirty = 1;
							nextstate_nru[dcache_addr.idx] = 1;
							nextstate_hit_count = hit_count + 1;
							if(dcache_addr.blkoff)
								nextstate_cache_entry.left_word2 = dcif.dmemstore;
							else
								nextstate_cache_entry.left_word1 = dcif.dmemstore;
						end
					end
					else if(dcache_addr.tag == cache_entry[dcache_addr.idx].right_tag_bits) begin
						if(~cache_entry[dcache_addr.idx].right_dirty && cache_entry[dcache_addr.idx].right_valid) begin
							cache_miss = 1;
							nextstate_cache_entry.right_dirty = 1;
							nextstate_nru[dcache_addr.idx] = 1;
						end
						else begin
							dcif.dhit = 1;
							nextstate_cache_entry.right_dirty = 1;
							nextstate_nru[dcache_addr.idx] = 0;
							nextstate_hit_count = hit_count + 1;
							if(dcache_addr.blkoff)
								nextstate_cache_entry.right_word2 = dcif.dmemstore;
							else
								nextstate_cache_entry.right_word1 = dcif.dmemstore;
						end
					end
					else begin
						cache_miss = 1;
						nextstate_hit_count = hit_count - 1;
						if(nextstate_nru[dcache_addr.idx]) begin
							nextstate_cache_entry.right_valid = 1;
							nextstate_cache_entry.right_dirty = 0;
						end
						else begin
							nextstate_cache_entry.left_valid = 1;
							nextstate_cache_entry.left_dirty = 0;
						end
					end
				end
			end
			if(cif.ccwait)
				cache_nextstate = CHECK_SNOOP_TARGET;
			else if(cache_miss) begin
				if(nru[dcache_addr.idx]) begin
					cache_nextstate = cache_entry[dcache_addr.idx].right_dirty? WRITE_TO_MEM1 : LOAD_FROM_MEM1;
					cif.cctrans = ~cache_entry[dcache_addr.idx].right_dirty;
				end
				else begin
					cache_nextstate = cache_entry[dcache_addr.idx].left_dirty? WRITE_TO_MEM1 : LOAD_FROM_MEM1;
					cif.cctrans = ~cache_entry[dcache_addr.idx].left_dirty;
				end
			end
		end
		WRITE_TO_MEM1: begin
			cif.dWEN = 1;
			if(nru[dcache_addr.idx]) begin
				cif.daddr = {cache_entry[dcache_addr.idx].right_tag_bits, dcache_addr.idx, 3'b000};
				cif.dstore = cache_entry[dcache_addr.idx].right_word1;
			end
			else begin
				cif.daddr = {cache_entry[dcache_addr.idx].left_tag_bits, dcache_addr.idx, 3'b000};
				cif.dstore = cache_entry[dcache_addr.idx].left_word1;
			end
			if(~cif.dwait)
				cache_nextstate = WRITE_TO_MEM2;
			else
				cache_nextstate = WRITE_TO_MEM1;
		end
		WRITE_TO_MEM2: begin
			cif.dWEN = 1;
			if(nru[dcache_addr.idx]) begin
				cif.daddr = {cache_entry[dcache_addr.idx].right_tag_bits, dcache_addr.idx, 3'b100};
				cif.dstore = cache_entry[dcache_addr.idx].right_word2;
			end
			else begin
				cif.daddr = {cache_entry[dcache_addr.idx].left_tag_bits, dcache_addr.idx, 3'b100};
				cif.dstore = cache_entry[dcache_addr.idx].left_word2;
			end
			if(~cif.dwait)
				cache_nextstate = LOAD_FROM_MEM1;
			else
				cache_nextstate = WRITE_TO_MEM2;
		end
		LOAD_FROM_MEM1: begin
			cif.cctrans = ~cif.ccwait;
			cif.dREN = 1;
			cif.daddr = {dcache_addr.tag, dcache_addr.idx, 3'b000};
			if(nru[dcache_addr.idx])
				nextstate_cache_entry.right_word1 = cif.dload;
			else
				nextstate_cache_entry.left_word1 = cif.dload;
			if(~cif.dwait)
				cache_nextstate = LOAD_FROM_MEM2;
			else
				cache_nextstate = LOAD_FROM_MEM1;
			if(cif.ccwait)
				cache_nextstate = CHECK_SNOOP_TARGET;
		end
		LOAD_FROM_MEM2: begin
			cif.dREN = 1;
			cif.daddr = {dcache_addr.tag, dcache_addr.idx, 3'b100};
			if(nru[dcache_addr.idx]) begin
				nextstate_cache_entry.right_word2 = cif.dload;
				nextstate_cache_entry.right_tag_bits = dcache_addr.tag;
				nextstate_cache_entry.right_dirty = dcif.dmemWEN;
			end
			else begin
				nextstate_cache_entry.left_word2 = cif.dload;
				nextstate_cache_entry.left_tag_bits = dcache_addr.tag;
				nextstate_cache_entry.left_dirty = dcif.dmemWEN;
			end
			if(~cif.dwait)
				cache_nextstate = IDLE;
			else
				cache_nextstate = LOAD_FROM_MEM2;
		end
		INVALIDATE_CONTROL: begin
			if(frame == 5'd16)
				cache_nextstate = HALT;
			else if(frame < 4'b1000) begin
				if(cache_entry[frame[2:0]].left_dirty) 
					cache_nextstate = INVALIDATE1;
				else begin
					next_frame = frame + 1;
					cache_nextstate = INVALIDATE_CONTROL;
				end
			end
			else if(frame > 4'b0111) begin
				if(cache_entry[frame[2:0]].right_dirty)
					cache_nextstate = INVALIDATE1;
				else begin
					next_frame = frame + 1;
					cache_nextstate = INVALIDATE_CONTROL;
				end
			end
		end
		INVALIDATE1: begin
			if(frame < 4'b1000) begin
				cif.daddr = {cache_entry[frame[2:0]].left_tag_bits, frame[2:0], 3'b000};
				cif.dstore = cache_entry[frame[2:0]].left_word1;
				cif.dWEN = 1;
			end
			else if(frame > 4'b0111) begin
				cif.daddr = {cache_entry[frame[2:0]].right_tag_bits, frame[2:0], 3'b000};
				cif.dstore = cache_entry[frame[2:0]].right_word1;
				cif.dWEN = 1;
			end
			if(~cif.dwait)
				cache_nextstate = INVALIDATE2;
			else
				cache_nextstate = INVALIDATE1;
		end
		INVALIDATE2: begin
			if(frame < 4'b1000) begin 
				cif.daddr = {cache_entry[frame[2:0]].left_tag_bits, frame[2:0], 3'b100};
				cif.dstore = cache_entry[frame[2:0]].left_word2;
				cif.dWEN = 1;
			end
			else if(frame > 4'b0111) begin 
				cif.daddr = {cache_entry[frame[2:0]].right_tag_bits, frame[2:0], 3'b100};
				cif.dstore = cache_entry[frame[2:0]].right_word2;
				cif.dWEN = 1;
			end
			if(~cif.dwait) begin
				cache_nextstate = INVALIDATE_CONTROL;
				next_frame = frame + 1;
			end
			else
				cache_nextstate = INVALIDATE2;
		end
		CHECK_SNOOP_TARGET: begin
			nextstate_link_register = (snoop_addr == link_register[31:0])? '0 : link_register;
			dirty_snoop = (snoop_addr.tag == cache_entry[snoop_addr.idx].left_tag_bits && cache_entry[snoop_addr.idx].left_dirty) || (snoop_addr.tag == cache_entry[snoop_addr.idx].right_tag_bits && cache_entry[snoop_addr.idx].right_dirty);
			if(cif.ccinv && !dirty_snoop) begin
				if(snoop_addr.tag == cache_entry[snoop_addr.idx].left_tag_bits) begin
					snoop_cache_entry.left_valid = 0;
					snoop_cache_entry.left_dirty = 0;
					snoop_cache_entry.left_tag_bits = '0;
				end
				else if(snoop_addr.tag == cache_entry[snoop_addr.idx].right_tag_bits) begin
					snoop_cache_entry.right_valid = 0;
					snoop_cache_entry.right_dirty = 0;
					snoop_cache_entry.right_tag_bits = '0;
				end
			end
			if(cif.ccwait) begin
				if(dirty_snoop) begin
					cache_nextstate = SHARE_WITH_CACHE1;
					cif.ccwrite = 1;
				end
				else if(!dirty_snoop || (snoop_addr.tag != cache_entry[snoop_addr.idx].left_tag_bits && snoop_addr.tag != cache_entry[snoop_addr.idx].right_tag_bits))
					cache_nextstate = CHECK_SNOOP_TARGET;
				cif.cctrans = dirty_snoop;
			end
			else 
				cache_nextstate = IDLE;
		end
		SHARE_WITH_CACHE1: begin
			cif.ccwrite = 1;
			if(snoop_addr.tag == cache_entry[snoop_addr.idx].left_tag_bits) begin
				cif.dstore = cache_entry[snoop_addr.idx].left_word1;
				cif.daddr = {cache_entry[snoop_addr.idx].left_tag_bits, snoop_addr.idx, 3'b000};
				snoop_cache_entry.left_dirty = 0;
			end
			else if(snoop_addr.tag == cache_entry[snoop_addr.idx].right_tag_bits) begin
				cif.dstore = cache_entry[snoop_addr.idx].right_word1;
				cif.daddr = {cache_entry[snoop_addr.idx].right_tag_bits, snoop_addr.idx, 3'b000};
				snoop_cache_entry.right_dirty = 0;
			end
			if(~cif.dwait)
				cache_nextstate = SHARE_WITH_CACHE2;
			else
				cache_nextstate = SHARE_WITH_CACHE1;
		end
		SHARE_WITH_CACHE2: begin
			cif.ccwrite = 1;
			if(snoop_addr.tag == cache_entry[snoop_addr.idx].left_tag_bits) begin
				cif.dstore = cache_entry[snoop_addr.idx].left_word2;
				cif.daddr = {cache_entry[snoop_addr.idx].left_tag_bits, snoop_addr.idx, 3'b100};
				snoop_cache_entry.left_dirty = 0;
			end
			else if(snoop_addr.tag == cache_entry[snoop_addr.idx].right_tag_bits) begin
				cif.dstore = cache_entry[snoop_addr.idx].right_word2;
				cif.daddr = {cache_entry[snoop_addr.idx].right_tag_bits, snoop_addr.idx, 3'b100};
				snoop_cache_entry.right_dirty = 0;
			end
			/*if(cif.ccinv) begin
				if(snoop_addr.tag == cache_entry[snoop_addr.idx].left_tag_bits) begin
					snoop_cache_entry.left_valid = 0;
					snoop_cache_entry.left_dirty = 0;
					snoop_cache_entry.left_tag_bits = '0;
				end
				else if(snoop_addr.tag == cache_entry[snoop_addr.idx].right_tag_bits) begin
					snoop_cache_entry.right_valid = 0;
					snoop_cache_entry.right_dirty = 0;
					snoop_cache_entry.right_tag_bits = '0;
				end
			end*/
			if(~cif.dwait)
				cache_nextstate = INVALIDATE_SHARED;
			else
				cache_nextstate = SHARE_WITH_CACHE2;
		end
		INVALIDATE_SHARED: begin
			if(cif.ccinv) begin
				if(snoop_addr.tag == cache_entry[snoop_addr.idx].left_tag_bits) begin
					snoop_cache_entry.left_valid = 0;
					snoop_cache_entry.left_dirty = 0;
					snoop_cache_entry.left_tag_bits = '0;
				end
				else if(snoop_addr.tag == cache_entry[snoop_addr.idx].right_tag_bits) begin
					snoop_cache_entry.right_valid = 0;
					snoop_cache_entry.right_dirty = 0;
					snoop_cache_entry.right_tag_bits = '0;
				end
			end
			cache_nextstate = IDLE;
		end
		HALT: begin
			dcif.flushed = 1;
			cache_nextstate = HALT;
		end
	endcase
end	

endmodule 
