`include "constant.v"
module memory(memRead, memWrite,value,location,out,led1,led2,led3,led4);
	input memRead;
	input memWrite;
	input [31:0]value;
	input [31:0]location;
	output reg [31:0]out;
	output reg led1;
	output reg led2;
	output reg led3;
	output reg led4;
	
	reg[31:0]mem_array[0:255];
	
	always @ *
	begin
	if (memRead == 1)
		out = mem_array[location];
	else if (memWrite == 1)
		mem_array[location] = value;
	
	led1 = mem_array[1][0];
	led2 = mem_array[1][1];
	led3 = mem_array[1][2];
	led4 = mem_array[1][3];
	end
endmodule
