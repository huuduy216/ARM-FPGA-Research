`include "constant.v"

module alu_test;
	reg [`SIZE -1:0]aluIn1;
	reg [`SIZE -1:0]aluIn2;
	reg [3:0]aluOp;
	reg [`SIZE -1:0]currentInst;
	wire [`SIZE -1:0]aluOut;

	alu alu1(aluIn1, aluIn2, aluOp, currentInst, aluOut);
	
	initial
	begin
		aluIn1 = 0;
		aluIn2 = 8'b11000001;
		aluOp = 4'b0010;
		currentInst = 0;
		#50;
		aluIn1 = 0;
		aluIn2 = 5;
		#50;
	end
endmodule