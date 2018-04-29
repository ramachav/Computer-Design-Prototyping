/*
Vaibhav Ramachandran
Instruction Fetch/Instruction Decode Pipeline Register Interface
ramachav@purdue.edu
Section 3
*/

`ifndef IFID_IF_VH
`define IFID_IF_VH

`include "cpu_types_pkg.vh"

interface IFID_if;

import cpu_types_pkg::*;

word_t imemload_if, pc_nextstate_if, pc_nextstate_id, imemload_id, imemaddr_if, imemaddr_id;
logic enable_ifid;
logic flush_ifid;
logic branch_hit_if, branch_hit_id;
logic [29:0] target_address_if, target_address_id;
logic [1:0] branch_history_if, branch_history_id;

modport IFID 
(
	input imemload_if, imemaddr_if, pc_nextstate_if, enable_ifid, flush_ifid, branch_hit_if, branch_history_if, target_address_if,
	output imemload_id, imemaddr_id, pc_nextstate_id, branch_hit_id, branch_history_id, target_address_id
);

endinterface

`endif