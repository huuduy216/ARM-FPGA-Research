module registers(input [7:0]readLoc1, [31:0]readLoc2, [31:0]writeLoc, input regWrite, [31:0]writeData, output reg [31:0]out1, [31:0]out2);
	reg [31:0]register[31:0];
		
	always @ * begin
	register[31] = 32'b0; //set X31 to zero
	out1 = register[readLoc1];
	out2 = register[readLoc2];
	if (regWrite == 1)
		register[writeLoc] = writeData;
	end
endmodule