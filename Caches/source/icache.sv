/*
Vaibhav Ramachandran
Direct-Mapped Instruction Cache Block
ramachav@purdue.edu
Section 3
*/

`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

module icache
(
	input CLK, nRST,
	datapath_cache_if dcif,
	caches_if.icache cif
);

import cpu_types_pkg::*;

typedef struct packed
{
	logic valid_bit;
	logic [25:0] tag_bits;
	word_t icache_data;
} icache_t;

icache_t cache_entry [15:0];
icachef_t icache_addr;

assign icache_addr = dcif.imemaddr; //Tag Bits: [31:6], Index Bits: [5:2], Byte Offset: [1:0]

always_ff @ (posedge CLK, negedge nRST) begin
	if(~nRST) begin
		cache_entry <= '{default:'0};
	end
	else begin
		if(~cif.iwait) begin
			cache_entry[icache_addr.idx].valid_bit <= 1;
			cache_entry[icache_addr.idx].tag_bits <= icache_addr.tag;
			cache_entry[icache_addr.idx].icache_data <= cif.iload;
		end
	end
end

always_comb begin
	cif.iREN = 0;
	cif.iaddr = '0;
	dcif.ihit = 0;
	dcif.imemload = '0;
	if(dcif.halt) begin
		cif.iREN = 0;
		cif.iaddr = '0;
		dcif.ihit = 0;
		dcif.imemload = '0;
	end
	else if(dcif.imemREN && ~dcif.dmemREN && ~dcif.dmemWEN) begin
		if(cache_entry[icache_addr.idx].valid_bit && icache_addr.tag == cache_entry[icache_addr.idx].tag_bits) begin
			dcif.ihit = 1;
			cif.iREN = 0;
			cif.iaddr = '0;
			dcif.imemload = cache_entry[icache_addr.idx].icache_data;
		end
		else begin
			dcif.ihit = ~cif.iwait;
			cif.iREN = dcif.imemREN;
			cif.iaddr = dcif.imemaddr;
			dcif.imemload = cif.iload;
		end
	end
end

endmodule 