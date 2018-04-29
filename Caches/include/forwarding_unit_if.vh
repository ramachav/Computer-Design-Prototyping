/*
Vaibhav Ramachandran
Forwarding Unit Interface
ramachav@purdue.edu
Section 3
*/

`ifndef FORWARDING_UNIT_IF_VH
`define FORWARDING_UNIT_IF_VH

`include "cpu_types_pkg.vh"

interface forwarding_unit_if;

import cpu_types_pkg::*;

logic [1:0] forward_A, forward_B;
logic RegWr_wb, RegWr_mem;
regbits_t RegDst_wb, RegDst_mem, Rs_ex, Rt_ex;

modport fu
(
	input RegWr_wb, RegWr_mem, RegDst_wb, RegDst_mem, Rs_ex, Rt_ex,
	output forward_A, forward_B
);

endinterface

`endif