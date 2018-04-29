/*
Vaibhav Ramachandran
Control Unit Testbench
ramachav@purdue.edu
Section 3
*/

`include "cpu_types_pkg.vh"
`include "control_unit_if.vh"
`timescale 1 ns / 1 ns

import cpu_types_pkg::*;

module control_unit_tb;

	control_unit_if tbcuif();
	logic CLK = 0, nRST;
	parameter PERIOD = 10;

	always #(PERIOD/2) CLK++;
	
	test PROG (CLK, nRST, tbcuif);
	
	`ifndef MAPPED
	control_unit DUT(tbcuif);
	`else
	control_unit DUT(
	.\tbcuif.Instruct (tbcuif.Instruct),
	.\tbcuif.funct (tbcuif.funct),
	.\tbcuif.zero (tbcuif.zero),
	.\tbcuif.overflow (tbcuif.overflow),
	.\tbcuif.RegWr (tbcuif.RegWr),
	.\tbcuif.RegDst (tbcuif.RegDst),
	.\tbcuif.ExtOp (tbcuif.ExtOp),
	.\tbcuif.iREN (tbcuif.iREN),
	.\tbcuif.dREN (tbcuif.dREN),
	.\tbcuif.dWEN (tbcuif.dWEN),
	.\tbcuif.jump (tbcuif.jump),
	.\tbcuif.jal (tbcuif.jal),
	.\tbcuif.jr (tbcuif.jr),
	.\tbcuif.lui (tbcuif.lui),
	.\tbcuif.mem2reg (tbcuif.mem2reg),
	.\tbcuif.PCSrc (tbcuif.PCSrc),
	.\tbcuif.ALUSrc (tbcuif.ALUSrc),
	.\tbcuif.halt (tbcuif.halt),
	.\tbcuif.ALUop (tbcuif.ALUop)
	);
	`endif

endmodule 

program test 
(
	input logic CLK,
	output logic nRST,
	control_unit_if tbcuif
);

int test_number = 0;
parameter CHECK_DELAY = 5;

initial begin

	//Test case 0: Reset everything
	nRST = 0;
	@(posedge CLK)
	@(posedge CLK)
	nRST = 1;

	//Checking r-type insturctions

	//Test case 1: Check left shift
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = RTYPE;
	tbcuif.funct = SLL;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SLL & tbcuif.ALUSrc == 2'b01 & tbcuif.RegWr & tbcuif.RegDst == 2'b01)
	$display("Test case 1 passed.");
	else $display("Test case 1 failed.");

	//Test case 2: Check right shift
	test_number++;
	@(posedge CLK)
	tbcuif.funct = SRL;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SRL & tbcuif.ALUSrc == 2'b01 & tbcuif.RegWr & tbcuif.RegDst == 2'b01)
	$display("Test case 2 passed.");
	else $display("Test case 2 failed.");

	//Test case 3: Check jump to register
	test_number++;
	@(posedge CLK)
	tbcuif.funct = JR;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(!tbcuif.RegWr & tbcuif.RegDst == 2'b01 & tbcuif.ALUSrc == 2'b00 & tbcuif.jr)
	$display("Test case 3 passed.");
	else $display("Test case 3 failed.");

	//Test case 4: Check add
	test_number++;
	@(posedge CLK)
	tbcuif.funct = ADD;
	tbcuif.zero = 0;
	tbcuif.overflow = 1;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_ADD & tbcuif.RegWr & tbcuif.RegDst == 2'b01 & tbcuif.ALUSrc == 2'b00)
	$display("Test case 4 passed.");
	else $display("Test case 4 failed.");

	//Test case 5: Check add unchecking overflow
	test_number++;
	@(posedge CLK)
	tbcuif.funct = ADDU;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_ADD & tbcuif.RegWr & tbcuif.RegDst == 2'b01 & tbcuif.ALUSrc == 2'b00)
	$display("Test case 5 passed.");
	else $display("Test case 5 failed.");

	//Test case 6: Check subtract
	test_number++;
	@(posedge CLK)
	tbcuif.funct = SUB;
	tbcuif.zero = 0;
	tbcuif.overflow = 1;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SUB & tbcuif.RegWr & tbcuif.RegDst == 2'b01 & tbcuif.ALUSrc == 2'b00)
	$display("Test case 6 passed.");
	else $display("Test case 6 failed.");

	//Test case 7: Check subtract unchecking overflow
	test_number++;
	@(posedge CLK)
	tbcuif.funct = SUBU;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SUB & tbcuif.RegWr & tbcuif.RegDst == 2'b01 & tbcuif.ALUSrc == 2'b00)
	$display("Test case 7 passed.");
	else $display("Test case 7 failed.");

	//Test case 8: Check AND
	test_number++;
	@(posedge CLK)
	tbcuif.funct = AND;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_AND & tbcuif.RegWr & tbcuif.RegDst == 2'b01 & tbcuif.ALUSrc == 2'b00)
	$display("Test case 8 passed.");
	else $display("Test case 8 failed.");

	//Test case 9: Check OR
	test_number++;
	@(posedge CLK)
	tbcuif.funct = OR;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_OR & tbcuif.RegWr & tbcuif.RegDst == 2'b01 & tbcuif.ALUSrc == 2'b00)
	$display("Test case 9 passed.");
	else $display("Test case 9 failed.");

	//Test case 10: Check XOR
	test_number++;
	@(posedge CLK)
	tbcuif.funct = XOR;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_XOR & tbcuif.RegWr & tbcuif.RegDst == 2'b01 & tbcuif.ALUSrc == 2'b00)
	$display("Test case 10 passed.");
	else $display("Test case 10 failed.");

	//Test case 11: Check NOR
	test_number++;
	@(posedge CLK)
	tbcuif.funct = NOR;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_NOR & tbcuif.RegWr & tbcuif.RegDst == 2'b01 & tbcuif.ALUSrc == 2'b00)
	$display("Test case 11 passed.");
	else $display("Test case 11 failed.");

	//Test case 12: Check signed less than
	test_number++;
	@(posedge CLK)
	tbcuif.funct = SLT;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SLT & tbcuif.RegWr & tbcuif.RegDst == 2'b01 & tbcuif.ALUSrc == 2'b00)
	$display("Test case 12 passed.");
	else $display("Test case 12 failed.");

	//Test case 13: Check unsigned less than
	test_number++;
	@(posedge CLK)
	tbcuif.funct = SLTU;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SLTU & tbcuif.RegWr & tbcuif.RegDst == 2'b01 & tbcuif.ALUSrc == 2'b00)
	$display("Test case 13 passed.");
	else $display("Test case 13 failed.");

	//Checking j-type instructions

	//Test case 14: Check jump to address
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = J;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SLL & !tbcuif.RegWr & tbcuif.RegDst == 2'b00 & tbcuif.jump & !tbcuif.mem2reg)
	$display("Test case 14 passed.");
	else $display("Test case 14 failed.");

	//Test case 15: Check jump and link
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = JAL;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SLL & tbcuif.jump & tbcuif.jal & tbcuif.RegWr & tbcuif.RegDst == 2'b10 & !tbcuif.mem2reg)
	$display("Test case 15 passed.");
	else $display("Test case 15 failed.");

	//Checking i-type instructions

	//Test case 16: Check branch if equal
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = BEQ;
	tbcuif.zero = 1;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SUB & tbcuif.PCSrc & !tbcuif.RegWr & !tbcuif.mem2reg)
	$display("Test case 16.1 passed.");
	else $display("Test case 16.1 failed.");

	#CHECK_DELAY
	tbcuif.zero = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SUB & !tbcuif.PCSrc & !tbcuif.RegWr & !tbcuif.mem2reg)
	$display("Test case 16.2 passed.");
	else $display("Test case 16.2 failed.");

	//Test case 17: Check branch if not equal
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = BNE;
	tbcuif.zero = 1;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SUB & !tbcuif.PCSrc & !tbcuif.RegWr & !tbcuif.mem2reg)
	$display("Test case 17.1 passed.");
	else $display("Test case 17.1 failed.");

	#CHECK_DELAY
	tbcuif.zero = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SUB & tbcuif.PCSrc & !tbcuif.RegWr & !tbcuif.mem2reg)
	$display("Test case 17.2 passed.");
	else $display("Test case 17.2 failed.");

	//Test case 18: Check add immediate 
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = ADDI;
	tbcuif.zero = 0;
	tbcuif.overflow = 1;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_ADD & tbcuif.ALUSrc == 2'b10 & tbcuif.RegWr & tbcuif.RegDst == 2'b00 & tbcuif.ExtOp)
	$display("Test case 18 passed.");
	else $display("Test case 18 failed.");

	//Test case 19: Check add immediate unchecked overflow
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = ADDIU;
	tbcuif.zero = 0;
	tbcuif.overflow = 1;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_ADD & tbcuif.ALUSrc == 2'b10 & tbcuif.RegWr & tbcuif.RegDst == 2'b00 & tbcuif.ExtOp)
	$display("Test case 19 passed.");
	else $display("Test case 19 failed.");

	//Test case 20: Check signed less than immediate
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = SLTI;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SLT & tbcuif.ALUSrc == 2'b10 & tbcuif.RegWr & tbcuif.RegDst == 2'b00 & tbcuif.ExtOp)
	$display("Test case 20 passed.");
	else $display("Test case 20 failed.");

	//Test case 21: Check unsigned less than immediate
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = SLTIU;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_SLTU & tbcuif.ALUSrc == 2'b10 & tbcuif.RegWr & tbcuif.RegDst == 2'b00 & tbcuif.ExtOp)
	$display("Test case 21 passed.");
	else $display("Test case 21 failed.");

	//Test case 22: Check AND immediate
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = ANDI;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_AND & tbcuif.ALUSrc == 2'b10 & tbcuif.RegWr & tbcuif.RegDst == 2'b00 & !tbcuif.ExtOp)
	$display("Test case 22 passed.");
	else $display("Test case 22 failed.");

	//Test case 23: Check OR immediate
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = ORI;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_OR & tbcuif.ALUSrc == 2'b10 & tbcuif.RegWr & tbcuif.RegDst == 2'b00 & !tbcuif.ExtOp)
	$display("Test case 23 passed.");
	else $display("Test case 23 failed.");

	//Test case 24: Check XOR immediate
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = XORI;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_XOR & tbcuif.ALUSrc == 2'b10 & tbcuif.RegWr & tbcuif.RegDst == 2'b00 & !tbcuif.ExtOp)
	$display("Test case 24 passed.");
	else $display("Test case 24 failed.");

	//Test case 25: Check load upper immediate
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = LUI;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.lui & tbcuif.RegWr & tbcuif.RegDst == 2'b00)
	$display("Test case 25 passed.");
	else $display("Test case 25 failed.");

	//Test case 26: Check load word
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = LW;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_ADD & tbcuif.ALUSrc == 2'b10 & tbcuif.RegWr & tbcuif.RegDst == 2'b00 & tbcuif.ExtOp & tbcuif.mem2reg & tbcuif.dREN)
	$display("Test case 26 passed.");
	else $display("Test case 26 failed.");

	//Test case 27: Check store word
	test_number++;
	@(posedge CLK)
	tbcuif.Instruct = SW;
	tbcuif.zero = 0;
	tbcuif.overflow = 0;
	#CHECK_DELAY
	#CHECK_DELAY
	assert(tbcuif.ALUop == ALU_ADD & tbcuif.ALUSrc == 2'b10 & tbcuif.ExtOp & !tbcuif.mem2reg & tbcuif.dWEN)
	$display("Test case 27 passed.");
	else $display("Test case 27 failed.");

	#CHECK_DELAY
	#CHECK_DELAY

$finish;
end

endprogram 