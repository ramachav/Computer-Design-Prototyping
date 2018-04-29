/*
Vaibhav Ramachandran
ramachav@purdue.edu

ALU File Interface
*/
`ifndef ALU_IF_VH
`define ALU_IF_VH

`include "cpu_types_pkg.vh"

interface alu_if;

import cpu_types_pkg::*;

logic [3:0] ALUOP;
word_t port_A, port_B, output_port;
logic negative, overflow, zero;

modport alu
(
	input ALUOP, port_A, port_B,
	output output_port, negative, overflow, zero
);

modport tb
(
	output ALUOP, port_A, port_B,
	input output_port, negative, overflow, zero
);
endinterface

`endif