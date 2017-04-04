`include "constant.v"
module pc(clock,nextInst,currentInst,pcNext);
	
	input clock;
	input [31:0]nextInst;
	output reg [31:0]currentInst;
	output reg [31:0]pcNext;
	reg [31:0]i;
	
	initial begin
		currentInst = 0;
		pcNext = 1;
	end
	always @ (posedge clock) begin
		if (nextInst == `NUMBER_OF_INSTRUCTION ) $exit;	
		currentInst = nextInst;
		pcNext = nextInst + 1;
	end
endmodule