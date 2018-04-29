/*
Vaibhav Ramachandran
ramachav@purdue.edu
Section 3
ALU File Testbench
*/
`include "alu_if.vh"
`include "cpu_types_pkg.vh"
`timescale 1 ns / 1 ns

import cpu_types_pkg::*;

module alu_tb;

	parameter PERIOD = 10;
	logic CLK = 0;

	always #(PERIOD / 2) CLK++;
	//Interface
	alu_if aluif();
	//Test Program
	test PROG (CLK, aluif);
	//DUT
	`ifndef MAPPED
	alu DUT(aluif);
	`else
	register_file DUT(
    	.\aluif.overflow (aluif.overflow),
    	.\aluif.zero (aluif.zero),
    	.\aluif.negative (aluif.negative),
    	.\aluif.port_A (aluif.port_A),
    	.\aluif.port_B (aluif.port_B),
    	.\aluif.output_port (aluif.output_port),
    	.\aluif.ALUOP (aluif.ALUOP)
    	);
`endif
endmodule

program test
(
	input logic CLK,
	alu_if.tb alutbif
);

parameter CHECK_DELAY = 5;
int test_number = 0;
int i;

initial begin

	//Test case 1: Testing ALU shift left by a certain number of bits specified by the port B input
	@(posedge CLK)
	test_number++;
	alutbif.ALUOP = ALU_SLL;
	alutbif.port_A = 32'h02030212;
	alutbif.port_B = 32'h00000004;
	#CHECK_DELAY
	if(alutbif.output_port == (alutbif.port_A << alutbif.port_B))
		$display("Test case 1 passed");
	
	//Test case 2: Testing ALU shift right by a certain number of bits specified by the port B input
	@(posedge CLK)
	test_number++;
	alutbif.ALUOP = ALU_SRL;
	alutbif.port_A = 32'h23212000;
	alutbif.port_B = 32'h0000000C;
	#CHECK_DELAY
	if(alutbif.output_port == (alutbif.port_A >> alutbif.port_B))
		$display("Test case 2 passed");
	
	//Test case 3: Testing ALU AND function. Also checking the zero flag if it gets set correctly
	@(posedge CLK)
	test_number++;
	alutbif.ALUOP = ALU_AND;
	alutbif.port_A = 32'h01234567;
	alutbif.port_B = 32'hFEDCBA98;
	#CHECK_DELAY
	if((alutbif.output_port == (alutbif.port_A & alutbif.port_B)) & (alutbif.zero))
		$display("Test case 3 passed");
	
	//Test case 4: Testing ALU OR function
	@(posedge CLK)
	test_number++;
	alutbif.ALUOP = ALU_OR;
	alutbif.port_A = 32'h00000000;
	alutbif.port_B = 32'hFEDCBA98;
	#CHECK_DELAY
	if(alutbif.output_port == (alutbif.port_A | alutbif.port_B))
		$display("Test case 4 passed");
	
	//Test case 5: Testing ALU NOR function
	@(posedge CLK)
	test_number++;
	alutbif.ALUOP = ALU_NOR;
	alutbif.port_A = 32'h00000000;
	alutbif.port_B = 32'hFEDCBA98;
	#CHECK_DELAY
	if(alutbif.output_port == ~(alutbif.port_A | alutbif.port_B))
		$display("Test case 5 passed");
	
	//Test case 6: Testing ALU XOR function
	@(posedge CLK)
	test_number++;
	alutbif.ALUOP = ALU_XOR;
	alutbif.port_A = 32'h01010101;
	alutbif.port_B = 32'hFEFEFEFE;
	#CHECK_DELAY
	if(alutbif.output_port == (alutbif.port_A ^ alutbif.port_B))
		$display("Test case 6 passed");
	
	//Test case 7: Testing ALU signed less than function
	@(posedge CLK)
	test_number++;
	alutbif.ALUOP = ALU_SLT;
	alutbif.port_A = 32'hFEDCBA98;
	alutbif.port_B = 32'hA0002397;
	#CHECK_DELAY
	if(alutbif.output_port == 0)
		$display("Test case 7.1 passed");
	@(posedge CLK)
	alutbif.ALUOP = ALU_SLT;
	alutbif.port_A = 32'h81234567;
	alutbif.port_B = 32'h01234567;
	#CHECK_DELAY
	if(alutbif.output_port == 1)
		$display("Test case 7.2 passed");
	
	//Test case 8: Testing ALU unsigned less than function
	@(posedge CLK)
	test_number++;
	alutbif.ALUOP = ALU_SLTU;
	alutbif.port_A = 32'hA0002397;
	alutbif.port_B = 32'hFEDCBA98;
	#CHECK_DELAY
	if(alutbif.output_port == 1)
		$display("Test case 8.1 passed");
	@(posedge CLK)
	alutbif.ALUOP = ALU_SLTU;
	alutbif.port_A = 32'h81234567;
	alutbif.port_B = 32'h01234567;
	#CHECK_DELAY
	if(alutbif.output_port == 0)
		$display("Test case 8.2 passed");
	
	//Test case 9: Testing ALU ADD function with: 1. no overflow and no negative, 2. negative only, 3. overflow cases
	@(posedge CLK)
	test_number++;
	alutbif.ALUOP = ALU_ADD;
	alutbif.port_A = 32'h22021402;
	alutbif.port_B = 32'h02030212;
	#CHECK_DELAY
	if(alutbif.output_port == 32'h24051614 & !alutbif.overflow & !alutbif.negative)
		$display("Test case 9.1 passed");
	@(posedge CLK)
	alutbif.ALUOP = ALU_ADD;
	alutbif.port_A = 32'h46464646;
	alutbif.port_B = 32'hB9B9B9B9;
	#CHECK_DELAY
	if(alutbif.output_port == 32'hFFFFFFFF & alutbif.negative)
		$display("Test case 9.2 passed");
	@(posedge CLK)
	alutbif.ALUOP = ALU_ADD;
	alutbif.port_A = 32'h7FFFFFFF;
	alutbif.port_B = 32'h00000001;
	#CHECK_DELAY
	if(alutbif.overflow == 1)
		$display("Test case 9.3 passed");
	@(posedge CLK)
	alutbif.ALUOP = ALU_ADD;
	alutbif.port_A = 32'hABCDEF76;
	alutbif.port_B = 32'h9ADEBADE;
	#CHECK_DELAY
	if(alutbif.overflow == 1)
		$display("Test case 9.4 passed");

	//Test case 10: Testing ALU SUB function with: 1. no overflow and no negative, 2. zero only, 3. overflow cases
	@(posedge CLK)
	test_number++;
	alutbif.ALUOP = ALU_SUB;
	alutbif.port_A = 32'h46464645;
	alutbif.port_B = 32'h46464644;
	#CHECK_DELAY
	if(alutbif.output_port == 1)
		$display("Test case 10.1 passed");
	@(posedge CLK)
	alutbif.ALUOP = ALU_SUB;
	alutbif.port_A = 32'h7FFFFFFF;
	alutbif.port_B = 32'h7FFFFFFF;
	#CHECK_DELAY
	if(alutbif.zero & !alutbif.overflow)
		$display("Test case 10.2 passed");
	@(posedge CLK)
	alutbif.ALUOP = ALU_SUB;
	alutbif.port_A = 32'h7FFFFFFF;
	alutbif.port_B = 32'h80002397;
	#CHECK_DELAY
	if(alutbif.overflow == 1)
		$display("Test case 10.3 passed");
	@(posedge CLK)
	alutbif.ALUOP = ALU_SUB;
	alutbif.port_A = 32'h80002397;
	alutbif.port_B = 32'h7FFFFFFF;
	#CHECK_DELAY
	if(alutbif.overflow == 1)
		$display("Test case 10.4 passed");
	
	#CHECK_DELAY
	#CHECK_DELAY
$finish;
end


endprogram 