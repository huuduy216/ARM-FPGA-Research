`include "constant.v"

module registers(readRegister1,readRegister2,regWrite,writeRegister,writeData,readData1,readData2,regLED1,regLED2,regLED3,regLED4);
	
	input [4:0]readRegister1;//Only need 5 bit to have 32 addresses
	input [31:0]readRegister2;
	input regWrite;
	input [4:0]writeRegister;//Only need 5 bit to have 32 addresses
	input [`SIZE-1:0]writeData;
	output [`SIZE-1:0]readData1;
	output [`SIZE-1:0]readData2;
	output reg regLED1;
	output reg regLED2;
	output reg regLED3;
	output reg regLED4;
	reg [`SIZE-1:0]readData1;
	reg [`SIZE-1:0]readData2;
	reg [`SIZE-1:0]register[31:0];//32 "SIZE"-bit registers
		
	always @ (readRegister1 or readRegister2 or regWrite or writeRegister or writeData) 
	begin
		register[`SIZE - 1] = 0;//Set register to 0
		readData1 = register[readRegister1];//Output the requested value
		readData2 = register[readRegister2];
		if (regWrite == 1)
			register[writeRegister] = writeData;//store the value
			
		/*regLED1 = ~register[1][0];
		regLED2 = ~register[1][1];
		regLED3 = ~register[1][2];
		regLED4 = ~register[1][3];*/
		
		regLED1 = ~writeData[0];
		regLED2 = ~writeData[1];
		regLED3 = ~writeData[2];
		regLED4 = ~writeData[3];
	end
endmodule