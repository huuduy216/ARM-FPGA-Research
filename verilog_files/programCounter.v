module progCount (input reg [31:0]nextInst, output reg [31:0]currentInst, [31:0]pcNext);
initial begin
currentInst = 0;
pcNext = 1;
end
always @ * begin
	if (nextInst == 16) $exit;
	#1 currentInst = nextInst;
	#1 pcNext = nextInst + 1;
end
endmodule