/*
Vaibhav Ramachandran
Request Unit Testbench
ramachav@purdue.edu
Section 3
*/

`include "cpu_types_pkg.vh"
`include "request_unit_if.vh"
`timescale 1 ns / 1 ns

import cpu_types_pkg::*;

module request_unit_tb;

	request_unit_if tbruif();
	logic CLK = 0, nRST;
	parameter PERIOD = 10;

	always #(PERIOD/2) CLK++;
	
	test PROG (CLK, nRST, tbruif);

	`ifndef MAPPED
	request_unit DUT(CLK, nRST, tbruif);
	`else
	request_unit DUT(
	.\tbruif.ihit(tbruif.ihit),	
	.\tbruif.dhit(tbruif.dhit),
	.\tbruif.iREN(tbruif.iREN),
	.\tbruif.dREN(tbruif.dREN),
	.\tbruif.dWEN(tbruif.dWEN),
	.\tbruif.halt(tbruif.halt),
	.\tbruif.dmemren(tbruif.dmemren),	
	.\tbruif.dmemwen(tbruif.dmemwen),
	.\tbruif.imemren(tbruif.imemren)
	);
	`endif

endmodule

program test
(
	input logic CLK,
	output logic nRST,
	request_unit_if tbruif
);

int test_number = 0;
parameter CHECK_DELAY = 5;

initial begin

	//Test case 1: Reset everything and check the outputs
	@(posedge CLK)
	test_number++;
	nRST = 0;
	@(posedge CLK)
	@(posedge CLK)
	nRST = 1;
	tbruif.ihit = 0;
	tbruif.dhit = 0;
	tbruif.dREN = 0;
	tbruif.dWEN = 0;
	tbruif.iREN = 0;
	@(posedge CLK)
	assert(!tbruif.dmemren & !tbruif.dmemwen & tbruif.imemren)
	$display("Test case 1 passed.");	
	else $display("Test case 1 failed.");

	//Test case 2: Turn on ihit and check the outputs
	test_number++;
	@(posedge CLK)
	tbruif.ihit = 1;
	tbruif.dhit = 0;
	tbruif.iREN = 1;
	tbruif.dREN = 1;
	tbruif.dWEN = 0;
	@(posedge CLK)
	assert(!tbruif.dmemwen & tbruif.dmemren & tbruif.imemren)
	$display("Test case 2.1 passed.");
	else $display("Test case 2.1 failed.");

	@(posedge CLK)
	tbruif.dREN = 0;
	tbruif.dWEN = 1;
	@(posedge CLK)
	assert(tbruif.dmemwen & !tbruif.dmemren & tbruif.imemren)
	$display("Test case 2.2 passed.");
	else $display("Test case 2.2 failed.");

	//Test case 3: Turn on dhit and check the outputs
	test_number++;
	@(posedge CLK)
	tbruif.ihit = 0;
	tbruif.dhit = 1;
	tbruif.iREN = 1;
	tbruif.dREN = 1;
	tbruif.dWEN = 0;
	@(posedge CLK)
	assert(!tbruif.dmemren & !tbruif.dmemwen & tbruif.imemren)
	$display("Test case 3 passed.");
	else $display("Test case 3 failed.");
	
	#CHECK_DELAY
	#CHECK_DELAY
$finish;
end 

endprogram 