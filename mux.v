`include "constant.v"

module mux(dataA,dataB,select,dataOut);
	input [`SIZE -1:0] dataA;
	input [`SIZE -1:0] dataB;
	input select;
	output reg [`SIZE -1:0] dataOut;
	
	always @ (dataA or dataB or select)
	begin
		if (select == 0)
			dataOut = dataA;
		else
			dataOut = dataB;
	end
endmodule