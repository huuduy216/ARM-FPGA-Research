module decoder(input [31:0]inst, output reg [10:0]opcode, [31:0]segA, [7:0]segB, [31:0]segC, [25:0]branchTarget);
always@* begin
if(inst[31:21] == 11'b11111000000) //store
begin
	opcode = inst[31:21]; //set opcode variable
	segA = inst[4:0]; //current data register
	segB = inst[9:5]; //location register
	segC = inst[20:12]; //offset
end
else if(inst[31:21] == 11'b11111000010) //load
begin
	opcode = inst[31:21];
	segA = inst[4:0]; //target register
	segB = inst[9:5]; //location register
	segC = inst[20:12]; //offset
end
else if(inst[31:22] == 10'b1101000100) //subi
begin
	opcode[10] = 0;
	opcode[9:0] = inst[31:22];
	segA = inst[4:0]; //destination register
	segB = inst[9:5]; //input register
	segC = inst[21:10]; //immediate
end
else if(inst[31:21] == 11'b11001011000) //sub
begin
	opcode = inst[31:21];
	segA = inst[4:0]; //destination register
	segB = inst[9:5]; //input register
	segC = inst[20:16]; //second input register
end
else if(inst[31:21] == 11'b10101010000) //or
begin
	opcode = inst[31:21];
	segA = inst[4:0]; //destination register
	segB = inst[9:5]; //input register
	segC = inst[20:16]; //second input register
end
else if(inst[31:24] == 11'b00010110101) //cbnz
begin
	opcode[10:8] = 3'b0;
	opcode[7:0] = inst[31:24];
	segA = inst[4:0]; //target register
	branchTarget = inst[23:5]; //address
end
else if(inst[31:24] == 8'b10110100) //cbz
begin
	opcode[10:8] = inst[31:24];
	segA = inst[4:0]; //target register
	branchTarget = inst[23:5]; //address
end
else if(inst[31:22] == 10'b1001000100) //addi
begin
	opcode[10] = 0;
	opcode[9:0] = inst[31:22];
	segA = inst[4:0]; //destination register
	segB = inst[9:5]; //input register
	segC = inst[21:10]; //immediate
end
else if(inst[31:21] == 11'b10001011000) //add
begin
	opcode = inst[31:21];
	segA = inst[4:0]; //destination register
	segB = inst[9:5]; //input register
	segC = inst[20:16]; //second input register
end
else if(inst[31:21] == 11'b10001010000) //and
begin
	opcode = inst[31:21];
	segA = inst[4:0]; //destination register
	segB = inst[9:5]; //input register
	segC = inst[20:16]; //second input register
end
else if(inst[31:26] == 6'b000101) //unconditional branch
begin
	opcode[10:6] = 5'b0;
	opcode[5:0] = inst[31:26];
	branchTarget = inst[25:0]; //branch address
end
else //nop
begin
	opcode = 11'b0;
	segA = 0;
	segB = 0;
	segC = 0;
	branchTarget = 0;
end
end
endmodule