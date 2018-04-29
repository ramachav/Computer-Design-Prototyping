/*
Vaibhav Ramachandran
Instruction Decode/Execute Pipeline Register Interface
ramachav@purdue.edu
Section 3
*/

`ifndef IDEX_IF_VH
`define IDEX_IF_VH

`include "cpu_types_pkg.vh"

interface IDEX_if;

import cpu_types_pkg::*;

logic enable_idex;
logic flush_idex;
word_t pc_nextstate_id, pc_nextstate_ex, rdat1_id, rdat1_ex, rdat2_id, rdat2_ex, imm16_extend_ex, imemaddr_id, imemload_id, imemaddr_ex, imemload_ex;
aluop_t ALUop_id, ALUop_ex;
logic [4:0] Rd_id, Rd_ex, Rt_id, Rt_ex, shamt_ex, Rs_id, Rs_ex;
logic [15:0] imm16_ex, imm16_id;
logic [1:0] ALUSrc_id, RegDst_id, ALUSrc_ex, RegDst_ex;
logic RegWr_id, RegWr_ex, halt_id, halt_ex, lui_id, lui_ex, dREN_id, dREN_ex, dWEN_id, dWEN_ex, beq_id, beq_ex, bne_id, bne_ex, jump_id, jump_ex, jal_id, jal_ex, jr_id, jr_ex, mem2reg_id, mem2reg_ex, ExtOp_id, ExtOp_ex;
logic [25:0] jumpaddr_id, jumpaddr_ex;
logic [3:0] jumpoffset_id;
logic branch_hit_id, branch_hit_ex;
logic [29:0] target_address_id, target_address_ex;
logic [1:0] branch_history_id, branch_history_ex;

modport IDEX
(
	input branch_hit_id, target_address_id, branch_history_id, jumpoffset_id, imemaddr_id, imemload_id, ExtOp_id, imm16_id, jumpaddr_id, pc_nextstate_id, rdat1_id, rdat2_id, ALUop_id, Rd_id, Rt_id, Rs_id, ALUSrc_id, RegDst_id, RegWr_id, halt_id, lui_id, dREN_id, dWEN_id, jump_id, jr_id, jal_id, mem2reg_id, beq_id, bne_id, enable_idex, flush_idex,
	output branch_hit_ex, target_address_ex, branch_history_ex, imemaddr_ex, imemload_ex, ExtOp_ex, shamt_ex, imm16_ex, jumpaddr_ex, pc_nextstate_ex, rdat1_ex, rdat2_ex, imm16_extend_ex, ALUop_ex, Rd_ex, Rt_ex, Rs_ex, ALUSrc_ex, RegDst_ex, RegWr_ex, halt_ex, lui_ex, dREN_ex, dWEN_ex, jump_ex, jr_ex, jal_ex, mem2reg_ex, beq_ex, bne_ex
);

endinterface

`endif