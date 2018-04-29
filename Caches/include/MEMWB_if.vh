/*
Vaibhav Ramachandran
Memory/Write Back Pipeline Register Interface
ramachav@purdue.edu
Section 3
*/

`ifndef MEMWB_IF_VH
`define MEMWB_IF_VH

`include "cpu_types_pkg.vh"

interface MEMWB_if;

import cpu_types_pkg::*;

logic enable_memwb, dhit;
logic mem2reg_mem, mem2reg_wb, jal_mem, jal_wb, lui_mem, lui_wb, RegWr_mem, RegWr_wb, halt_mem, halt_wb;
logic [4:0] RegDst_mem, RegDst_wb;
word_t wdat_mem, wdat_wb, dmemload, pc_nextstate_mem, pc_nextstate_wb, dmemload_wb, imemaddr_mem, imemload_mem, imemaddr_wb, imemload_wb;
logic [15:0] imm16_mem, imm16_wb;

modport MEMWB
(
	input imemaddr_mem, imemload_mem, enable_memwb, mem2reg_mem, jal_mem, lui_mem, RegWr_mem, RegDst_mem, wdat_mem, dmemload, pc_nextstate_mem, imm16_mem, halt_mem, dhit,
	output imemload_wb, imemaddr_wb, mem2reg_wb, jal_wb, lui_wb, RegWr_wb, RegDst_wb, wdat_wb, pc_nextstate_wb, imm16_wb, dmemload_wb, halt_wb
);

endinterface

`endif