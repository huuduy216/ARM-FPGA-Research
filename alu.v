`include "constant.v"

module alu(instA,instB,aluOp,currentInst,aluOut);

	input [`SIZE -1:0]instA;
	input [`SIZE -1:0]instB;
	input [3:0]aluOp;
	input [`SIZE -1:0]currentInst;
	output reg [`SIZE -1:0]aluOut;
	
	always @ *
	case(aluOp)
		4'b0010: aluOut = instA + instB; //add
		4'b1000: aluOut = instA; //branch
		4'b0111:
			if (instA == 0)
				aluOut = instB; //CBZ
		4'b1001:
			begin 
					if (instA != 0)
						aluOut = instB; //CBNZ: calculate branch address
					else
						aluOut = currentInst;
			end
		4'b0110: aluOut = instA - instB; //subtract
		4'b0000: aluOut = instA & instB; //and
		4'b0001: aluOut = instA | instB; //or
		default: aluOut = 0;
	endcase 
	
endmodule