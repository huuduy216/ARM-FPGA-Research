`include "constant.v"

module instMem(progCount,inst);
	
	input [31:0]progCount;
	output reg [31:0]inst;
	reg [31:0]instructions[`NUMBER_OF_INSTRUCTION-1:0];

	initial begin
	instructions[0] = 32'b10010001000000011010011111100001; //addi X1, X31, 111
	
	end
	always @ (progCount) begin
	#1 inst = instructions[progCount];
	
	end
endmodule