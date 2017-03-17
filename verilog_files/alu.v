module alu(input [31:0]inA, [31:0]inB, [3:0]aluOp, [31:0]currentInst, output reg [31:0]out);
	always @ *
	case(aluOp)
		4'b0010: out = inA + inB; //add
		4'b1000: out = inA; //branch
		4'b0111: if (inA == 0) out = inB; //CBZ: calculate branch address
		4'b1001: begin 
				if (inA != 0) out = inB; //CBNZ: calculate branch address
				else out = currentInst;
				end
		4'b0110: out = inA - inB; //subtract
		4'b0000: out = inA & inB; //and
		4'b0001: out = inA | inB; //or
		default: out = 0;
	endcase
	
endmodule