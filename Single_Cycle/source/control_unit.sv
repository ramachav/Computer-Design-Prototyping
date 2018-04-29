/*
Vaibhav Ramachandran
Control Unit
ramachav@purdue.edu
Section 3
*/
`include "cpu_types_pkg.vh"
`include "control_unit_if.vh"

module control_unit
(
	control_unit_if cuif
);

import cpu_types_pkg::*;

always_comb begin
	cuif.PCSrc = 0;
	cuif.RegWr = 0;
	cuif.ExtOp = 0;
	cuif.dREN = 0;
	cuif.dWEN = 0;
	cuif.jal = 0;
	cuif.jump = 0;
	cuif.mem2reg = 0;
	cuif.jr = 0;
	cuif.lui = 0;
	cuif.ALUSrc = '0;	//00: rdat2,	01: shamt,	10: Imm16
	cuif.RegDst = '0;	//00: Rt,	01: Rd,		10: $31
	cuif.ALUop = ALU_SLL;
	cuif.halt = 0;

	casez(cuif.Instruct)
		//R-Type instructions//
		RTYPE: begin
			cuif.RegDst = 2'b01;
			cuif.ALUSrc = 2'b00;

			casez(cuif.funct)
				SLL: begin
					cuif.ALUSrc = 2'b01;
					cuif.ALUop = ALU_SLL;
					cuif.RegWr = 1;
				end
				SRL: begin
					cuif.ALUSrc = 2'b01;
					cuif.ALUop = ALU_SRL;
					cuif.RegWr = 1;
				end
				JR: begin
					cuif.jr = 1;
					cuif.RegWr = 0;
				end
				ADD: begin
					cuif.ALUop = ALU_ADD;
					cuif.RegWr = 1;
				end

				ADDU: begin
					cuif.ALUop = ALU_ADD;
					cuif.RegWr = 1;
				end

				SUB: begin
					cuif.ALUop = ALU_SUB;
					cuif.RegWr = 1;
				end

				SUBU: begin
					cuif.ALUop = ALU_SUB;
					cuif.RegWr = 1;
				end

				AND: begin
					cuif.ALUop = ALU_AND;
					cuif.RegWr = 1;
				end

				OR: begin
					cuif.ALUop = ALU_OR;
					cuif.RegWr = 1;
				end

				XOR: begin
					cuif.ALUop = ALU_XOR;
					cuif.RegWr = 1;
				end

				NOR: begin
					cuif.ALUop = ALU_NOR;
					cuif.RegWr = 1;
				end

				SLT: begin
					cuif.ALUop = ALU_SLT;
					cuif.RegWr = 1;
				end

				SLTU: begin
					cuif.ALUop = ALU_SLTU;
					cuif.RegWr = 1;
				end

			endcase
		end
		//J-Type instructions//
		J: 	cuif.jump = 1;

		JAL: begin
			cuif.jump = 1;
			cuif.jal = 1;
			cuif.RegWr = 1;
			cuif.RegDst = 2'b10;
		end
		//I-Type instructions//
		BEQ: begin
			cuif.ALUop = ALU_SUB;
			cuif.PCSrc = cuif.zero;
		end
		BNE: begin
			cuif.ALUop = ALU_SUB;
			cuif.PCSrc = ~cuif.zero;
		end
		ADDI: begin
			cuif.ExtOp = 1;
			cuif.ALUSrc = 2'b10;
			cuif.ALUop = ALU_ADD;
			cuif.RegWr = 1;
			cuif.RegDst = 2'b00;
		end
		ADDIU: begin
			cuif.ExtOp = 1;
			cuif.ALUSrc = 2'b10;
			cuif.ALUop = ALU_ADD;
			cuif.RegWr = 1;
			cuif.RegDst = 2'b00;
		end
		SLTI: begin
			cuif.ExtOp = 1;
			cuif.ALUSrc = 2'b10;
			cuif.ALUop = ALU_SLT;
			cuif.RegWr = 1;
			cuif.RegDst = 2'b00;
		end
		SLTIU: begin
			cuif.ExtOp = 1;
			cuif.ALUSrc = 2'b10;
			cuif.ALUop = ALU_SLTU;
			cuif.RegWr = 1;
			cuif.RegDst = 2'b00;
		end
		ANDI: begin
			cuif.ALUSrc = 2'b10;
			cuif.ALUop = ALU_AND;
			cuif.RegWr = 1;
			cuif.RegDst = 2'b00;
		end
		ORI: begin
			cuif.ALUSrc = 2'b10;
			cuif.ALUop = ALU_OR;
			cuif.RegWr = 1;
			cuif.RegDst = 2'b00;
		end
		XORI: begin
			cuif.ALUSrc = 2'b10;
			cuif.ALUop = ALU_XOR;
			cuif.RegWr = 1;
			cuif.RegDst = 2'b00;
		end
		LUI: begin
			cuif.lui = 1;
			cuif.RegWr = 1;
			cuif.RegDst = 2'b00;
		end
		LW: begin
			cuif.ExtOp = 1;
			cuif.ALUSrc = 2'b10;
			cuif.ALUop = ALU_ADD;
			cuif.mem2reg = 1;
			cuif.RegWr = 1;
			cuif.RegDst = 2'b00;
			cuif.dREN = 1;
		end
		SW: begin
			cuif.ExtOp = 1;
			cuif.ALUSrc = 2'b10;
			cuif.ALUop = ALU_ADD;
			cuif.dWEN = 1;
		end
		HALT: 	cuif.halt = 1;

	endcase
end

//assign cuif.halt = (cuif.Instruct == HALT);
assign cuif.iREN = (cuif.Instruct != HALT);

endmodule
