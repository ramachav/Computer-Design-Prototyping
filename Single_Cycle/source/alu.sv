/*Vaibhav Ramachandran
Arithmetic Logic Unit
Section 3
ramachav@purdue.edu
*/

`include "alu_if.vh"
`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;

module alu
(
	alu_if.alu aluif
);

logic [32:0] previous_state_output;
logic [31:0] subtraction_complement;

assign subtraction_complement = (~aluif.port_B + 1);

always_comb begin

casez(aluif.ALUOP)

	ALU_SLL: begin
		previous_state_output = aluif.port_A << aluif.port_B[5:0];
	end
	ALU_SRL: begin
		previous_state_output = aluif.port_A >> aluif.port_B[5:0];
	end
	ALU_ADD: begin
		previous_state_output = {aluif.port_A[31], aluif.port_A} + {aluif.port_B[31], aluif.port_B};
	end
	ALU_SUB: begin
		previous_state_output = {aluif.port_A[31], aluif.port_A} + {subtraction_complement[31], subtraction_complement};
	end
	ALU_AND: begin
		previous_state_output = aluif.port_A & aluif.port_B;
	end
	ALU_OR: begin
		previous_state_output = aluif.port_A | aluif.port_B;
	end
	ALU_XOR: begin
		previous_state_output = aluif.port_A ^ aluif.port_B;
	end
	ALU_NOR: begin
		previous_state_output = ~(aluif.port_A | aluif.port_B);
	end
	ALU_SLT: begin
		previous_state_output = ( signed'(aluif.port_A) < signed'(aluif.port_B) )? 1 : 0;
	end
	ALU_SLTU: begin
		previous_state_output = (aluif.port_A < aluif.port_B)? 1 : 0;
	end
	default: begin
		previous_state_output = '0;
	end
endcase
end

assign aluif.overflow = (previous_state_output[32:31] == 2'b10 | previous_state_output[32:31] == 2'b01);
assign aluif.zero = (previous_state_output == '0);
assign aluif.negative = (previous_state_output[31] == 1'b1);
assign aluif.output_port = previous_state_output[31:0];

endmodule 