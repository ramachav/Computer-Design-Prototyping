/*
Vaibhav Ramachandran
Forwarding Unit
ramachav@purdue.edu
Section 3
*/

`include "cpu_types_pkg.vh"
`include "forwarding_unit_if.vh"

module forwarding_unit
(
	forwarding_unit_if fuif
);

import cpu_types_pkg::*;

always_comb begin
	fuif.forward_A = 2'b00;
	fuif.forward_B = 2'b00;
	if(fuif.RegDst_wb != '0 && fuif.RegWr_wb && fuif.RegDst_wb == fuif.Rs_ex)
		fuif.forward_A = 2'b01;
	if(fuif.RegDst_mem != '0 && fuif.RegWr_mem && fuif.RegDst_mem == fuif.Rs_ex)
		fuif.forward_A = 2'b10;
	if(fuif.RegDst_wb != '0 && fuif.RegWr_wb && fuif.RegDst_wb == fuif.Rt_ex)
		fuif.forward_B = 2'b01;
	if(fuif.RegDst_mem != '0 && fuif.RegWr_mem && fuif.RegDst_mem == fuif.Rt_ex)
		fuif.forward_B = 2'b10;
end

endmodule
