/*
Vaibhav Ramachandran
Control Unit Interface
ramachav@purdue.edu
Section 3
*/
`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

`include "cpu_types_pkg.vh"

interface control_unit_if;

import cpu_types_pkg::*;

logic beq, bne, RegWr, ExtOp, iREN, dREN, dWEN, jump, jal, mem2reg, halt, lui, jr, zero, overflow, datomic;
logic [1:0] ALUSrc, RegDst;
aluop_t ALUop;
opcode_t Instruct;
funct_t funct;

modport cu
(
	input Instruct, funct, overflow, 
	output RegWr, RegDst, ExtOp, iREN, dREN, dWEN, jump, jal, jr, lui, mem2reg, beq, bne, ALUSrc, halt, ALUop, datomic
);

endinterface

`endif