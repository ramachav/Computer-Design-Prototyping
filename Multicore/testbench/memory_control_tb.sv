/*
Vaibhav Ramachandran
Memory Control Testbench
ramachav@purdue.edu
Section 3
*/

`include "cpu_types_pkg.vh"
`include "cache_control_if.vh"
`include "caches_if.vh"
`include "cpu_ram_if.vh"
`timescale 1 ns / 1 ns

import cpu_types_pkg::*;

module memory_control_tb;

	caches_if cif0(), cif1();
	cache_control_if #(.CPUS(2)) tbccif (cif0, cif1);
	cpu_ram_if tbramif();
	logic CLK = 0;
	logic nRST;
	parameter PERIOD = 10;
	
	always #(PERIOD/2) CLK++;

	test PROG (CLK, nRST, tbccif);

	`ifndef MAPPED
	memory_control DUT(CLK, nRST, tbccif);
	`else
	memory_control DUT(
	.\tbccif.iREN (tbccif.iREN),
	.\tbccif.dREN (tbccif.dREN),
	.\tbccif.dWEN (tbccif.dWEN),
	.\tbccif.dstore (tbccif.dstore),
	.\tbccif.iaddr (tbccif.iaddr),
	.\tbccif.daddr (tbccif.daddr),
	.\tbccif.ramload (tbccif.ramload),
	.\tbccif.ramstate (tbccif.ramstate),
	.\tbccif.ccwrite (tbccif.ccwrite),
	.\tbccif.cctrans (tbccif.cctrans),
	.\tbccif.iwait (tbccif.iwait),
	.\tbccif.dwait (tbccif.dwait),
	.\tbccif.iload (tbccif.iload),
	.\tbccif.dload (tbccif.dload),
	.\tbccif.ramstore (tbccif.ramstore),
	.\tbccif.ramaddr (tbccif.ramaddr),
	.\tbccif.ramWEN (tbccif.ramWEN),
	.\tbccif.ramREN (tbccif.ramREN),
	.\tbccif.ccwait (tbccif.ccwait),
	.\tbccif.ccinv (tbccif.ccinv),
	.\tbccif.ccsnoopaddr (tbccif.ccsnoopaddr)
	);
	`endif
	`ifndef MAPPED
	ram RAMDUT (CLK, nRST, tbramif);
	`else
	ram RAMDUT(
	.\tbramif.ramaddr (tbramif.ramaddr),
	.\tbramif.ramstore (tbramif.ramstore),
	.\tbramif.ramREN(tbramif.ramREN),
	.\tbramif.ramWEN(tbramif.ramWEN),
	.\tbramif.ramstate(tbramif.ramstate),
	.\tbramif.ramload(tbramif.ramload)
	);
	`endif

assign tbramif.ramaddr = tbccif.ramaddr;
assign tbramif.ramREN = tbccif.ramREN;
assign tbramif.ramWEN = tbccif.ramWEN;
assign tbramif.ramstore = tbccif.ramstore;

endmodule

program test
(
	input logic CLK,
	output logic nRST,
	cache_control_if tbccif
);

int test_number = 0;
parameter CHECK_DELAY = 5;

typedef enum logic [3:0] {IDLE, FETCH_INSTRUCTION, SET_CACHE_ROLES, SNOOP_INTO_CACHE, WRITE_TO_MEM1, WRITE_TO_MEM2, LOAD_FROM_MEM1, LOAD_FROM_MEM2, LOAD_FROM_CACHE1, LOAD_FROM_CACHE2, KEEP_COHERENCE1, KEEP_COHERENCE2} memory_bus_controller;
memory_bus_controller bus_state_expected;

initial begin

	$display("Cache Controller Test Cases: ");
	//Test case 0: Reset everything and then check the outputs
	test_number = 0;
	nRST = 0;
	@(posedge CLK)
	@(posedge CLK)
	nRST = 1;
	cif0.iREN = '0;
	cif0.dREN = '0;
	cif0.dWEN = '0;
	cif0.daddr = '0;
	cif0.iaddr = '0;
	cif0.dstore = '0;
	cif0.ccwrite = '0;	
	cif0.cctrans = '0;
	cif1.iREN = '0;
	cif1.dREN = '0;
	cif1.dWEN = '0;
	cif1.daddr = '0;
	cif1.iaddr = '0;
	cif1.dstore = '0;
	cif1.ccwrite = '0;	
	cif1.cctrans = '0;
	tbccif.ramload = '0;
	tbccif.ramstate = FREE;
	bus_state_expected = IDLE;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(cif0.iwait && cif1.iwait && cif0.dwait && cif1.dwait && !tbccif.ramREN && !tbccif.ramWEN && !cif0.iload && !cif1.iload && !cif0.dload && !cif1.dload && !tbccif.ramstore && !tbccif.ramaddr && !cif0.ccinv && !cif1.ccinv && !cif0.ccwait && !cif1.ccwait && !cif0.ccsnoopaddr && !cif1.ccsnoopaddr)
	$display("Test case 0 passed.");
	else $display("Test case 0 failed.");

	//Test case 1: Test the instruction fetch routine for the icache of each core
	$display("Test the instruction fetch routine for the icache of each core");

	//Test case 1.1: Core 1 testing
	@(posedge CLK)
	$display("Test case 1.1: Core 1 testing");
	test_number++;
	cif0.iREN = 1;
	cif0.iaddr = 32'h12341234;
	tbccif.ramload = 32'hBAD0C0DE;
	@(posedge CLK)
	bus_state_expected = FETCH_INSTRUCTION;
	@(posedge CLK)
	assert(cif0.iwait && tbccif.ramREN && cif0.iload == 32'hBAD0C0DE && tbccif.ramaddr == 32'h12341234)
	$display("	Test case 1.1.1 passed.");
	else $display("		Test case 1.1.1 failed."); 
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	assert(cif0.iwait)
	$display("	Test case 1.1.2 passed.");
	else $display("		Test case 1.1.2 failed.");
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = IDLE;
	cif0.iREN = 0;
	cif0.iaddr = '0;

	//Test case 1.2: Core 2 testing
	@(posedge CLK)
	$display("Test case 1.2: Core 2 testing");
	cif1.iREN = 1;
	cif1.iaddr = 32'h12341234;
	tbccif.ramload = 32'hBAD0C0DE;
	@(posedge CLK)
	bus_state_expected = FETCH_INSTRUCTION;
	@(posedge CLK)
	assert(cif1.iwait && tbccif.ramREN && cif1.iload == 32'hBAD0C0DE && tbccif.ramaddr == 32'h12341234)
	$display("	Test case 1.2.1 passed.");
	else $display("		Test case 1.2.1 failed."); 
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	assert(cif1.iwait)
	$display("	Test case 1.2.2 passed.");
	else $display("		Test case 1.2.2 failed.");
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = IDLE;
	cif1.iREN = 0;
	cif1.iaddr = '0;

	//Test case 2: Test the snooping protocol of each core when there is a snoop miss and data must be loaded from memory
	$display("Test the snooping protocol of each core when there is a snoop miss and data must be loaded from memory");
	
	//Test case 2.1: Core 1 testing
	@(posedge CLK)
	$display("Test case 2.1: Core 1 testing");
	test_number++;
	cif0.cctrans = 1;
	cif0.dREN = 1;
	cif0.daddr = 32'h00005678;
	tbccif.ramload = 32'hFEEDBEEF;
	@(posedge CLK)
	bus_state_expected = SET_CACHE_ROLES;
	assert(cif1.ccwait && cif1.ccsnoopaddr == 32'h00005678)
	$display("	Test case 2.1.1 passed.");
	else $display("		Test case 2.1.1 failed.");
	@(posedge CLK)
	bus_state_expected = SNOOP_INTO_CACHE;
	@(posedge CLK)
	bus_state_expected = LOAD_FROM_MEM1;
	assert(cif1.ccwait && cif0.dwait && cif0.dload == 32'hFEEDBEEF && tbccif.ramREN && tbccif.ramaddr == 32'h00005678)
	$display("	Test case 2.1.2 passed.");
	else $display("		Test case 2.1.2 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = LOAD_FROM_MEM2;
	cif0.daddr = 32'h0000567C;
	tbccif.ramload = 32'hBAD00CAB;
	#CHECK_DELAY
	assert(cif1.ccwait && cif0.dwait && cif0.dload == 32'hBAD00CAB && tbccif.ramREN && tbccif.ramaddr == 32'h0000567C)
	$display("	Test case 2.1.3 passed.");
	else $display("		Test case 2.1.3 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = IDLE;
	cif0.cctrans = 0;
	cif0.dREN = 0;
	cif0.daddr = '0;

	//Test case 2.2: Core 2 testing
	@(posedge CLK)
	$display("Test case 2.2: Core 2 testing");
	cif1.cctrans = 1;
	cif1.dREN = 1;
	cif1.daddr = 32'h00005678;
	tbccif.ramload = 32'hFEEDBEEF;
	@(posedge CLK)
	bus_state_expected = SET_CACHE_ROLES;
	assert(cif0.ccwait && cif0.ccsnoopaddr == 32'h00005678)
	$display("	Test case 2.2.1 passed.");
	else $display("		Test case 2.2.1 failed.");
	@(posedge CLK)
	bus_state_expected = SNOOP_INTO_CACHE;
	@(posedge CLK)
	bus_state_expected = LOAD_FROM_MEM1;
	assert(cif0.ccwait && cif1.dwait && cif1.dload == 32'hFEEDBEEF && tbccif.ramREN && tbccif.ramaddr == 32'h00005678)
	$display("	Test case 2.2.2 passed.");
	else $display("		Test case 2.2.2 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = LOAD_FROM_MEM2;
	cif1.daddr = 32'h0000567C;
	tbccif.ramload = 32'hBAD00CAB;
	#CHECK_DELAY
	assert(cif0.ccwait && cif1.dwait && cif1.dload == 32'hBAD00CAB && tbccif.ramREN && tbccif.ramaddr == 32'h0000567C)
	$display("	Test case 2.2.3 passed.");
	else $display("		Test case 2.2.3 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = IDLE;
	cif1.cctrans = 0;
	cif1.dREN = 0;
	cif1.daddr = '0;

	//Test case 3: Test the snooping protocol of each core when there is a snoop hit and the hit is clean so the data must be supplied by the other dcache 
	$display("Test the snooping protocol of each core when there is a snoop hit and the hit is clean so the data must be supplied by the other dcache ");

	//Test case 3.1: Core 1 testing
	@(posedge CLK)
	$display("Test case 3.1: Core 1 testing");
	test_number++;
	cif0.cctrans = 1;
	cif0.dREN = 1;
	cif0.daddr = 32'h14141414;
	cif1.dstore = 32'hFACEBEAD;
	@(posedge CLK)
	bus_state_expected = SET_CACHE_ROLES;
	cif1.cctrans = 1;
	assert(cif1.ccwait && cif1.ccsnoopaddr == 32'h14141414)
	$display("	Test case 3.1.1 passed.");
	else $display("		Test case 3.1.1 failed.");
	@(posedge CLK)
	bus_state_expected = SNOOP_INTO_CACHE;
	@(posedge CLK)
	bus_state_expected = LOAD_FROM_CACHE1;
	assert(cif1.ccwait && cif1.ccsnoopaddr == 32'h14141414 && cif0.dload == 32'hFACEBEAD)
	$display("	Test case 3.1.2 passed.");
	else $display("		Test case 3.1.2 failed.");
	@(posedge CLK)
	bus_state_expected = LOAD_FROM_CACHE2;
	cif1.dstore = 32'h1BADCAFE;
	#CHECK_DELAY
	assert(cif1.ccwait && cif1.ccsnoopaddr == 32'h14141414 && cif0.dload == 32'h1BADCAFE)
	$display("	Test case 3.1.3 passed.");
	else $display("		Test case 3.1.3 failed.");
	@(posedge CLK)
	bus_state_expected = IDLE;
	cif0.cctrans = 0;
	cif0.dREN = 0;
	cif0.daddr = '0;
	cif1.dstore = '0;
	cif1.cctrans = 0;

	//Test case 3.2: Core 2 testing
	@(posedge CLK)
	$display("Test case 3.2: Core 2 testing");
	cif1.cctrans = 1;
	cif1.dREN = 1;
	cif1.daddr = 32'h14141414;
	cif0.dstore = 32'hFACEBEAD;
	@(posedge CLK)
	bus_state_expected = SET_CACHE_ROLES;
	cif0.cctrans = 1;
	assert(cif0.ccwait && cif0.ccsnoopaddr == 32'h14141414)
	$display("	Test case 3.2.1 passed.");
	else $display("		Test case 3.2.1 failed.");
	@(posedge CLK)
	bus_state_expected = SNOOP_INTO_CACHE;
	@(posedge CLK)
	bus_state_expected = LOAD_FROM_CACHE1;
	assert(cif0.ccwait && cif0.ccsnoopaddr == 32'h14141414 && cif1.dload == 32'hFACEBEAD)
	$display("	Test case 3.2.2 passed.");
	else $display("		Test case 3.2.2 failed.");
	@(posedge CLK)
	bus_state_expected = LOAD_FROM_CACHE2;
	cif0.dstore = 32'h1BADCAFE;
	#CHECK_DELAY
	assert(cif0.ccwait && cif0.ccsnoopaddr == 32'h14141414 && cif1.dload == 32'h1BADCAFE)
	$display("	Test case 3.2.3 passed.");
	else $display("		Test case 3.2.3 failed.");
	@(posedge CLK)
	bus_state_expected = IDLE;
	cif1.cctrans = 0;
	cif1.dREN = 0;
	cif1.daddr = '0;
	cif0.dstore = '0;
	cif0.cctrans = 0;

	//Test case 4: Test the snooping protocol of each core when there is a snoop hit but the hit is dirty so the data must be supplied by the other dcache and memory must be updated
	$display("Test the snooping protocol of each core when there is a snoop hit but the hit is dirty so the data must be supplied by the other dcache and memory must be updated");

	//Test case 4.1: Core 1 testing
	@(posedge CLK)
	$display("Test case 4.1: Core 1 testing");
	test_number++;
	cif0.cctrans = 1;
	cif0.dREN = 1;
	cif0.daddr = 32'h21203020;
	cif1.daddr = 32'h00004440;
	cif1.dstore = 32'hBADABADA;
	@(posedge CLK)
	bus_state_expected = SET_CACHE_ROLES;
	cif1.cctrans = 1;
	cif1.ccwrite = 1;
	assert(cif1.ccwait && cif1.ccsnoopaddr == 32'h21203020)
	$display("	Test case 4.1.1 passed.");
	else $display("		Test case 4.1.1 failed.");
	@(posedge CLK)
	bus_state_expected = SNOOP_INTO_CACHE;
	@(posedge CLK)
	bus_state_expected = KEEP_COHERENCE1;
	assert(cif1.ccwait && cif0.dwait && cif1.dwait && cif0.dload == 32'hBADABADA && cif1.ccsnoopaddr == 32'h21203020 && tbccif.ramWEN && tbccif.ramaddr == 32'h00004440 && tbccif.ramstore == 32'hBADABADA)
	$display("	Test case 4.1.2 passed.");
	else $display("		Test case 4.1.2 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = KEEP_COHERENCE2;
	cif1.daddr = 32'h00004444;
	cif1.dstore = 32'hBAD1BAD1;
	@(posedge CLK)
	assert(cif1.ccwait && cif0.dwait && cif1.dwait && cif0.dload == 32'hBAD1BAD1 && cif1.ccsnoopaddr == 32'h21203020 && tbccif.ramWEN && tbccif.ramaddr == 32'h00004444 && tbccif.ramstore == 32'hBAD1BAD1)
	$display("	Test case 4.1.3 passed.");
	else $display("		Test case 4.1.3 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = IDLE;
	cif0.cctrans = 0;
	cif0.dREN = 0;
	cif0.daddr = '0;
	cif1.daddr = '0;
	cif1.dstore = '0;
	cif1.cctrans = 0;
	cif1.ccwrite = 0;

	//Test case 4.2: Core 2 testing
	@(posedge CLK)
	$display("Test case 4.2: Core 2 testing");
	cif1.cctrans = 1;
	cif1.dREN = 1;
	cif1.daddr = 32'h21203020;
	cif0.daddr = 32'h00004440;
	cif0.dstore = 32'hBADABADA;
	@(posedge CLK)
	bus_state_expected = SET_CACHE_ROLES;
	cif0.cctrans = 1;
	cif0.ccwrite = 1;
	assert(cif0.ccwait && cif0.ccsnoopaddr == 32'h21203020)
	$display("	Test case 4.2.1 passed.");
	else $display("		Test case 4.2.1 failed.");
	@(posedge CLK)
	bus_state_expected = SNOOP_INTO_CACHE;
	@(posedge CLK)
	bus_state_expected = KEEP_COHERENCE1;
	assert(cif0.ccwait && cif1.dwait && cif0.dwait && cif1.dload == 32'hBADABADA && cif0.ccsnoopaddr == 32'h21203020 && tbccif.ramWEN && tbccif.ramaddr == 32'h00004440 && tbccif.ramstore == 32'hBADABADA)
	$display("	Test case 4.2.2 passed.");
	else $display("		Test case 4.2.2 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = KEEP_COHERENCE2;
	cif0.daddr = 32'h00004444;
	cif0.dstore = 32'hBAD1BAD1;
	@(posedge CLK)
	assert(cif0.ccwait && cif1.dwait && cif0.dwait && cif1.dload == 32'hBAD1BAD1 && cif0.ccsnoopaddr == 32'h21203020 && tbccif.ramWEN && tbccif.ramaddr == 32'h00004444 && tbccif.ramstore == 32'hBAD1BAD1)
	$display("	Test case 4.2.3 passed.");
	else $display("		Test case 4.2.3 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = IDLE;
	cif1.cctrans = 0;
	cif1.dREN = 0;
	cif1.daddr = '0;
	cif0.daddr = '0;
	cif0.dstore = '0;
	cif0.cctrans = 0;
	cif0.ccwrite = 0;

	//Test case 5: Test the write back to memory routine for each core when the dWEN signal for that cache is asserted
	$display("Test the write back to memory routine for each core when the dWEN signal for that cache is asserted");

	//Test case 5.1: Core 1 testing
	@(posedge CLK)
	$display("Test case 5.1: Core 1 testing");
	test_number++;
	cif0.dWEN = 1;
	cif0.daddr = 32'h76543210;
	cif0.dstore = 32'h12345678;
	@(posedge CLK)
	bus_state_expected = WRITE_TO_MEM1;
	assert(cif1.ccwait && cif0.dwait && tbccif.ramWEN && tbccif.ramaddr == 32'h76543210 && tbccif.ramstore == 32'h12345678)
	$display("	Test case 5.1.1 passed.");
	else $display("		Test case 5.1.1 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = WRITE_TO_MEM2;
	cif0.daddr = 32'h76543214;
	cif0.dstore = 32'h87654321;
	#CHECK_DELAY
	assert(cif1.ccwait && cif0.dwait && tbccif.ramWEN && tbccif.ramaddr == 32'h76543214 && tbccif.ramstore == 32'h87654321)
	$display("	Test case 5.1.2 passed.");
	else $display("		Test case 5.1.2 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = IDLE;
	cif0.dWEN = 0;
	cif0.daddr = '0;
	cif0.dstore = '0;

	//Test case 5.2: Core 2 testing
	@(posedge CLK)
	$display("Test case 5.2: Core 2 testing");
	cif1.dWEN = 1;
	cif1.daddr = 32'h76543210;
	cif1.dstore = 32'h12345678;
	@(posedge CLK)
	bus_state_expected = WRITE_TO_MEM1;
	assert(cif0.ccwait && cif1.dwait && tbccif.ramWEN && tbccif.ramaddr == 32'h76543210 && tbccif.ramstore == 32'h12345678)
	$display("	Test case 5.2.1 passed.");
	else $display("		Test case 5.2.1 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = WRITE_TO_MEM2;
	cif1.daddr = 32'h76543214;
	cif1.dstore = 32'h87654321;
	#CHECK_DELAY
	assert(cif0.ccwait && cif1.dwait && tbccif.ramWEN && tbccif.ramaddr == 32'h76543214 && tbccif.ramstore == 32'h87654321)
	$display("	Test case 5.2.2 passed.");
	else $display("		Test case 5.2.2 failed.");
	@(posedge CLK)
	tbccif.ramstate = ACCESS;
	@(posedge CLK)
	tbccif.ramstate = FREE;
	bus_state_expected = IDLE;
	cif1.dWEN = 0;
	cif1.daddr = '0;
	cif1.dstore = '0;	

	dump_memory();

$finish;
end

task automatic dump_memory();
    string filename = "memcpu.hex";
    int memfd;

    cif0.daddr = 0;
    cif0.dWEN = 0;
    cif0.iREN = 0;
    cif0.dREN = 0;

    memfd = $fopen(filename,"w");
    if (memfd)
      $display("Starting memory dump.");
    else
      begin $display("Failed to open %s.",filename); $finish; end

    for (int unsigned i = 0; memfd && i < 16384; i++)
    begin
      int chksum = 0;
      bit [7:0][7:0] values;
      string ihex;

      cif0.daddr = i << 2;
      cif0.dREN = 1;
      repeat (4) @(posedge CLK);
      if (cif0.dload === 0)
        continue;
      values = {8'h04,16'(i),8'h00,cif0.dload};
      foreach (values[j])
        chksum += values[j];
      chksum = 16'h100 - chksum;
      ihex = $sformatf(":04%h00%h%h",16'(i),cif0.dload,8'(chksum));
      $fdisplay(memfd,"%s",ihex.toupper());
    end //for
    if (memfd)
    begin
      cif0.dREN = 0;
      $fdisplay(memfd,":00000001FF");
      $fclose(memfd);
      $display("Finished memory dump.");
    end
  endtask

endprogram
