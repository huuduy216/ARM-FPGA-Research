`include "constant.v"

module decoder(inst,opcode,segA,segB,segC,branchTarget);

	input [31:0]inst;//instruction code
	output reg [10:0]opcode;//opcode always 11 bit
	output reg [9:0]segA;//5-10 bits
	output reg [4:0]segB;//4-5 bits
	output reg [9:0]segC;//9-10 bits
	output reg [25:0]branchTarget;//19-25 bits address
	
	always@* begin
	if(inst[31:21] == 11'b11111000000) //STORE
	begin
		opcode = inst[31:21]; //set opcode variable
		segA = inst[4:0]; //current data register
		segB = inst[9:5]; //location register
		segC = inst[20:12]; //offset
	end
	else if(inst[31:21] == 11'b11111000010) //LOAD
	begin
		opcode = inst[31:21];
		segA = inst[4:0]; //target register
		segB = inst[9:5]; //location register
		segC = inst[20:12]; //offset
	end
	else if(inst[31:22] == 10'b1101000100) //SUBI
	begin
		opcode[10] = 0;
		opcode[9:0] = inst[31:22];
		segA = inst[4:0]; //destination register
		segB = inst[9:5]; //input register
		segC = inst[21:10]; //immediate
	end
	else if(inst[31:21] == 11'b11001011000) //SUB
	begin
		opcode = inst[31:21];
		segA = inst[4:0]; //destination register
		segB = inst[9:5]; //input register
		segC = inst[20:16]; //second input register
	end
	else if(inst[31:21] == 11'b10101010000) //OR
	begin
		opcode = inst[31:21];
		segA = inst[4:0]; //destination register
		segB = inst[9:5]; //input register
		segC = inst[20:16]; //second input register
	end
	else if(inst[31:24] == 11'b00010110101) //CBNZ
	begin
		opcode[10:8] = 3'b0;//IS THIS REALLY NEEDED?
		opcode[7:0] = inst[31:24];
		segA = inst[4:0]; //target register
		branchTarget = inst[23:5]; //address
	end
	else if(inst[31:24] == 8'b10110100) //CBZ
	begin
		opcode[10:8] = inst[31:24];
		segA = inst[4:0]; //target register
		branchTarget = inst[23:5]; //address
	end
	else if(inst[31:22] == 10'b1001000100) //ADDI
	begin
		opcode[10] = 0;
		opcode[9:0] = inst[31:22];
		segA = inst[4:0]; //destination register
		segB = inst[9:5]; //input register
		segC = inst[21:10]; //immediate
	end
	else if(inst[31:21] == 11'b10001011000) //ADD
	begin
		opcode = inst[31:21];
		segA = inst[4:0]; //destination register
		segB = inst[9:5]; //input register
		segC = inst[20:16]; //second input register
	end
	else if(inst[31:21] == 11'b10001010000) //AMD
	begin
		opcode = inst[31:21];
		segA = inst[4:0]; //destination register
		segB = inst[9:5]; //input register
		segC = inst[20:16]; //second input register
	end
	else if(inst[31:26] == 6'b000101) //B (unconditional branch)
	begin
		opcode[10:6] = 5'b0;//IS THIS REALLY NEEDED?
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