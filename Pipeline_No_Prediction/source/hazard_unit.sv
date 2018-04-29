/*
Vaibhav Ramachandran
Hazard Detection Unit
ramachav@purdue.edu
Section 3
*/

`include "cpu_types_pkg.vh"
`include "hazard_unit_if.vh"

module hazard_unit
(
	hazard_unit_if huif
);

import cpu_types_pkg::*;

assign huif.pc_wen = ~huif.stall_ifid;
assign huif.stall_ifid = ((huif.dREN_ex || huif.dWEN_ex) && ~huif.dhit && huif.RegWr_mem && (huif.Rs_id == huif.Rt_ex || huif.Rt_id == huif.Rt_ex));
assign huif.flush_ifid = huif.jump_ex || huif.jump_id; 
assign huif.flush_idex = huif.jump_ex || huif.stall_ifid;
assign huif.lduse_hit = huif.stall_ifid;

endmodule 
