`include "constant.v"

module cache_test;
	reg[31:0]value;
	reg[31:0]address;
	reg memRead;
	reg memWrite;
	wire[31:0]out;
	wire hit;
	wire led0;
	wire led1;
	wire led2;
	wire led3;

	cache cache1(memRead, memWrite,value,address,out,hit,led0,led1,led2,led3);

	initial
	begin
		memRead = 1;
		address = 32'b10100;
		#10;
		//Read block 5
		memRead = 1;
		address = 32'b11111111111111111111110000010100;
		#10;
		//write to block 7
		memRead = 0;
		memWrite = 1;
		value = 99;
		address = 32'b11111111111111111111110000011100;
		#10;
		//read block 7 (should lane a hit)
		memRead = 1;
		memWrite = 0;
		address = 32'b11111111111111111111110000011100;
		#10;
		//read block
		memRead = 1;
		memWrite = 0;
		address = 32'b11111111111111111111110000011100;
		#10;
		//read block 1
		memRead = 1;
		memWrite = 0;
		address = 32'b11111111111111111111110000000100;
		#10;
		memRead = 0;
		memWrite =0;
	end
endmodule