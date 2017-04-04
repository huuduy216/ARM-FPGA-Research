`include "constant.v"
module cache(memRead, memWrite,value,location,out,led1,led2,led3,led4);
	
	parameter mode = 0;//0 = direct map, 1 = set associative, 2 = fully associative
	input memRead;
	input memWrite;
	input [31:0]value;
	input [31:0]location;
	output reg [31:0]out;
	output reg led1;
	output reg led2;
	output reg led3;
	output reg led4;
	integer i;
	
	if(mode == 0)
		reg[32:0]mem_array[0:255];//1 blocks per line
	else if(mode == 1)
		reg[63:0]mem_array[0:127];//2 blocks per line (2 way set associative)
	else
		reg[8192:0]mem_array;//256 blocks per line (fully associative)
	
	reg age[255:0];//keep track of last use block (age counter)
	
	initial
	begin
		//Initialize every memory block in increasement of 5
		if(mode == 0)
		begin
			for(i = 0; i < 255; i++)
				mem_array[i] = i * 5;
		end
		else if(mode == 1)
		begin
			mem_array[0][31:0] = 0;
			mem_array[0][63:32] = 5;
			for(i = 1; i < 127; i++)
			begin
				mem_array[i][31:0] = mem_array[i-1][31:0] + 10;
				mem_array[i][63:32] = mem_array[i-1][31:0] + 10;
			end
		end
		else
		begin
			mem_array[31:0] = 5;
			for(i = 1; i < 255; i++)
				mem_array[64*i-1:32*i-1] = i*5+5;
		end
		//Initialize age counter
		for(i = 0; i < 255; i++0)
			age[i] = i;
	end
	
	
	always @ (memRead or memWrite or value or location)
	begin
		if (memRead == 1)
			if(mode == 0)
			begin
			
			end
			else if(mode == 1)
			begin
			
			end
			
			else if
			out = mem_array[location];
		else if (memWrite == 1)
			begin
				mem_array[location] = value;
				
			end
		led1 = mem_array[1][0];
		led2 = mem_array[1][1];
		led3 = mem_array[1][2];
		led4 = mem_array[1][3];
	end
endmodule
