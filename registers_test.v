`include "constant.v"

module regiter_test;
	reg [4:0]readReg1;
	reg [4:0]readReg2;
	reg write;
	reg [4:0] writeReg;
	reg [`SIZE-1:0] data;
	wire [`SIZE-1:0] readData1;//Need to fix hard-coded problem (constant expression cannot contain a hierarchial identifier)z
	wire [`SIZE-1:0] readData2;

	registers registers1 (readReg1,readReg2,write,writeReg,data,readData1,readData2);

	initial
	begin
		write = 1;
		writeReg = 10;
		data = 12345;
		readReg1 = 10;
		readReg2 = 15;
		#10;
		writeReg = 15;
		data = 54321;
		#10;
		writeReg = 15;
		data = 2332;
		#10;
		write = 0;
		writeReg = 15;
		data = 54321;
		#10;//last portion won't show on test, tried adding this time but won't help 
	end
endmodule

