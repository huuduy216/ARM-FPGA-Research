`include "constant.v"

module instMem(progCount,inst);
	
	input [31:0]progCount;
	output reg [31:0]inst;
	reg [31:0]instructions[`NUMBER_OF_INSTRUCTION-1:0];

	initial begin
	instructions[0] = 32'b10010001000000100000011111100001; //addi X1, X31, 2
	instructions[1] = 32'b10010001000000110000011111100001; //addi X1, X31, 3
	
	end
	always @ * begin
	#1 inst = instructions[progCount + 1];
	
	end
endmodule