module memory(input memRead, memWrite, [31:0]value, [31:0]location, output reg [31:0]out);
	reg[31:0]mem_array[0:255];
	initial begin
		mem_array[54] = 061594;
	end
	always @ *
	begin
	if (memRead == 1)
		out = mem_array[location];
	else if (memWrite == 1)
		mem_array[location] = value;
	end
endmodule
