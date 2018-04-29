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
	cache_control_if #(.CPUS(1)) tbccif (cif0, cif1);
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
assign tbccif.ramstate = tbramif.ramstate;
assign tbccif.ramload = tbramif.ramload;

endmodule

program test
(
	input logic CLK,
	output logic nRST,
	cache_control_if.cc tbccif
);

int test_number = 0;
parameter CHECK_DELAY = 5;

initial begin

	//Test case 1: Reset everything and then check the outputs
	test_number++;
	nRST = 0;
	@(posedge CLK)
	@(posedge CLK)
	nRST = 1;
	cif0.iREN = 0;
	cif0.dREN = 0;
	cif0.dWEN = 0;
	cif0.daddr = '0;
	cif0.iaddr = '0;
	cif0.dstore = '0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbccif.iwait & tbccif.dwait & ~tbccif.ramREN & ~tbccif.ramWEN)
	$display("Passed Test Case 1.");
	else $display("Failed Test Case 1.");

	//Test case 2: 	Write data to a bunch of addresses
	@(posedge CLK)
	test_number++;
	nRST = 1;
	cif0.iREN = 1;
	cif0.dREN = 0;
	cif0.dWEN = 1;
	cif0.daddr = 32'hBEEF00D8;
	cif0.iaddr = '0;
	cif0.dstore = 32'hDEADFEED;
	@(negedge tbccif.dwait)
	assert(tbccif.ramstore == 32'hDEADFEED & tbccif.ramaddr == cif0.daddr & ~tbccif.ramREN)
	$display("Passed Test Case 2.1");
	else $display("Failed Test Case 2.1");
	#CHECK_DELAY
	#CHECK_DELAY
	cif0.daddr = 32'hBEEF00DC;
	cif0.iaddr = '0;
	cif0.dstore = 32'hFEEDBEEF;
	@(negedge tbccif.dwait)
	assert(tbccif.ramstore == 32'hFEEDBEEF & tbccif.ramaddr == cif0.daddr & ~tbccif.ramREN)
	$display("Passed Test Case 2.2");
	else $display("Failed Test Case 2.2");
	#CHECK_DELAY
	#CHECK_DELAY
	cif0.daddr = 32'hBEEF00E0;
	cif0.iaddr = '0;
	cif0.dstore = 32'hAABBCCDD;
	@(negedge tbccif.dwait)
	assert(tbccif.ramstore == 32'hAABBCCDD & tbccif.ramaddr == cif0.daddr & ~tbccif.ramREN)
	$display("Passed Test Case 2.3");
	else $display("Failed Test Case 2.3");
	#CHECK_DELAY
	#CHECK_DELAY
	cif0.daddr = 32'hBEEF00E4;
	cif0.iaddr = '0;
	cif0.dstore = 32'h12345678;
	@(negedge tbccif.dwait)
	assert(tbccif.ramstore == 32'h12345678 & tbccif.ramaddr == cif0.daddr & ~tbccif.ramREN)
	$display("Passed Test Case 2.4");
	else $display("Failed Test Case 2.4");
	#CHECK_DELAY
	#CHECK_DELAY
	cif0.daddr = 32'hBEEF00E8;
	cif0.iaddr = '0;
	cif0.dstore = 32'hBAD0CAFE;
	@(negedge tbccif.dwait)
	assert(tbccif.ramstore == 32'hBAD0CAFE & tbccif.ramaddr == cif0.daddr & ~tbccif.ramREN)
	$display("Passed Test Case 2.5");
	else $display("Failed Test Case 2.5");

	//Test case 3: Read data from the previous addresses
	@(posedge CLK)
	test_number++;
	nRST = 1;
	cif0.iREN = 1;
	cif0.dREN = 1;
	cif0.dWEN = 0;
	cif0.daddr = 32'hBEEF00DC;
	cif0.iaddr = '0;
	cif0.dstore = 32'h0;
	@(negedge tbccif.dwait)
	assert(tbccif.ramload == 32'hFEEDBEEF & cif0.dload == 32'hFEEDBEEF & tbccif.ramaddr == cif0.daddr)
	$display("Passed Test Case 3.1");
	else $display("Failed Test Case 3.1");
	#CHECK_DELAY
	#CHECK_DELAY
	cif0.daddr = 32'hBEEF00E4;
	cif0.iaddr = '0;
	cif0.dstore = 32'h0;
	@(negedge tbccif.dwait)
	assert(tbccif.ramload == 32'h12345678 & cif0.dload == 32'h12345678 & tbccif.ramaddr == cif0.daddr)
	$display("Passed Test Case 3.2");
	else $display("Failed Test Case 3.2");
	#CHECK_DELAY
	#CHECK_DELAY
	cif0.daddr = 32'hBEEF00D8;
	cif0.iaddr = '0;
	cif0.dstore = 32'h0;
	@(negedge tbccif.dwait)
	assert(tbccif.ramload == 32'hDEADFEED & cif0.dload == 32'hDEADFEED & tbccif.ramaddr == cif0.daddr)
	$display("Passed Test Case 3.3");
	else $display("Failed Test Case 3.3");
	#CHECK_DELAY
	#CHECK_DELAY
	cif0.daddr = 32'hBEEF00E8;
	cif0.iaddr = '0;
	cif0.dstore = 32'h0;
	@(negedge tbccif.dwait)
	assert(tbccif.ramload == 32'hBAD0CAFE & cif0.dload == 32'hBAD0CAFE & tbccif.ramaddr == cif0.daddr)
	$display("Passed Test Case 3.4");
	else $display("Failed Test Case 3.4");
	#CHECK_DELAY
	#CHECK_DELAY
	cif0.daddr = 32'hBEEF00E0;
	cif0.iaddr = '0;
	cif0.dstore = 32'h0;
	@(negedge tbccif.dwait)
	assert(tbccif.ramload == 32'hAABBCCDD & cif0.dload == 32'hAABBCCDD & tbccif.ramaddr == cif0.daddr)
	$display("Passed Test Case 3.5");
	else $display("Failed Test Case 3.5");

	//Test case 4: Read instructions from addresses
	@(posedge CLK)
	test_number++;
	nRST = 1;
	cif0.iREN = 1;
	cif0.dREN = 0;
	cif0.dWEN = 0;
	cif0.daddr = 32'hBEEF0CAB;
	cif0.iaddr = 32'hBEEF00D8;
	cif0.dstore = 32'h0;
	for( int i = 0; i < 5; i++) begin
		@(negedge tbccif.iwait)
		assert(cif0.iload == tbccif.ramload & tbccif.ramaddr == cif0.iaddr)
		$display("Passed Test Case 4.%d", i + 1);
		else $display("Failed Test Case 4.%d", i + 1);
		#CHECK_DELAY
		#CHECK_DELAY
		cif0.iaddr = cif0.iaddr + 4;
	end

	//Test case 5: Assert both the iREN and dWEN signals to check if the arbitration is correct
	@(posedge CLK)
	test_number++;
	nRST = 1;
	cif0.iREN = 1;
	cif0.dREN = 0;
	cif0.dWEN = 1;
	cif0.daddr = 32'hBEEF00EC;
	cif0.iaddr = 32'hBEEF00DC;
	cif0.dstore = 32'h08080808;
	@(negedge tbccif.dwait)
	assert(tbccif.ramaddr == cif0.daddr & tbccif.ramstore == 32'h08080808 & ~tbccif.ramREN & tbccif.ramWEN & tbccif.iwait)
	$display("Passed Test Case 5.");
	else $display("Failed Test Case 5.");

	//Test case 6: Assert both the iREN and dREN signals to check if the arbitration is correct
	@(posedge CLK)
	test_number++;
	nRST = 1;
	cif0.iREN = 1;
	cif0.dREN = 1;
	cif0.dWEN = 0;
	cif0.daddr = 32'hBEEF00D8;
	cif0.iaddr = 32'hBEEF00E8;
	cif0.dstore = 32'h0;
	@(negedge tbccif.dwait)
	assert(tbccif.ramaddr == cif0.daddr & cif0.dload == 32'hDEADFEED & tbccif.ramREN & ~tbccif.ramWEN & tbccif.iwait)
	$display("Passed Test Case 6.");
	else $display("Failed Test Case 6.");
	#CHECK_DELAY
	#CHECK_DELAY

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
