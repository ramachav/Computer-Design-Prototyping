/*
Vaibhav Ramachandran
Hazard Detection Unit Interface
ramachav@purdue.edu
Section 3
*/

`ifndef HAZARD_UNIT_IF_VH
`define HAZARD_UNIT_IF_VH

`include "cpu_types_pkg.vh"

interface hazard_unit_if;

import cpu_types_pkg::*;

logic flush_idex, dREN_ex, dWEN_ex, stall_ifid, flush_ifid, jump_ex, jump_id, branch_mem, dhit, pc_wen, lduse_hit, RegWr_mem;
regbits_t Rs_id, Rt_id, Rt_ex;

modport hu
(
	input jump_id, jump_ex, branch_mem, dREN_ex, dWEN_ex, dhit, Rs_id, Rt_id, Rt_ex, RegWr_mem,
	output stall_ifid, flush_ifid, flush_idex, pc_wen, lduse_hit
);

endinterface

`endif
