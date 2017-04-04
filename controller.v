module controller(opCode,reg2Loc,branch,memRead,memToReg,aluOp,memWrite,aluSrc,regWrite);
	input [10:0] opCode;
	output reg reg2Loc;
	output reg branch;
	output reg memRead;
	output reg memToReg;
	output reg [3:0]aluOp;
	output reg memWrite;
	output reg aluSrc;
	output reg regWrite;
	
	always @ (opCode)
	case(opCode)
		6'b000101:
			begin 	
				aluOp = 4'b1000; //branch
				reg2Loc = 1;
				branch = 1;
				memRead = 0;
				memWrite = 0;
				memToReg = 0;
				aluSrc = 0;
				regWrite = 0;
			end
		11'b10001010000:
			begin
				aluOp = 4'b0000; //and
				reg2Loc = 0;
				branch = 0;
				memRead = 0;
				memToReg = 0;
				memWrite = 0;
				aluSrc = 0;
				regWrite = 1;
			end
		11'b10001011000:
			begin
				aluOp = 4'b0010; //add
				reg2Loc = 0;
				branch = 0;
				memRead = 0;
				memToReg = 0;
				memWrite = 0;
				aluSrc = 0;
				regWrite = 1;
			end
		11'b01001000100:
			begin
				aluOp = 4'b0010; //addi
				reg2Loc = 0;
				branch = 0;
				memRead = 0;
				memToReg = 0;
				memWrite = 0;
				aluSrc = 1;
				regWrite = 1;
			end
		8'b10110100:
			begin
				aluOp = 4'b0111; //cbz
				reg2Loc = 1;
				branch = 1;
				memRead = 0;
				memWrite = 0;
				memToReg = 0;
				aluSrc = 0;
				regWrite = 0;
			end
		11'b00010110101:
			begin
				aluOp = 4'b1001; //cbnz
				reg2Loc = 1;
				branch = 1;
				memRead = 0;
				memWrite = 0;
				memToReg = 0;
				aluSrc = 0;
				regWrite = 0;
			end
		11'b10101010000:
			begin
				aluOp = 4'b0001; //or
				reg2Loc = 0;
				branch = 0;
				memRead = 0;
				memToReg = 0;
				memWrite = 0;
				aluSrc = 0;
				regWrite = 1;
			end
		11'b11001011000:
			begin
				aluOp = 4'b0110;//sub
				reg2Loc = 0;
				branch = 0;
				memRead = 0;
				memToReg = 0;
				memWrite = 0;
				aluSrc = 0;
				regWrite = 1;
			end
		10'b1101000100:
			begin
				aluOp = 4'b0110; //subi
				reg2Loc = 0;
				branch = 0;
				memRead = 0;
				memToReg = 0;
				memWrite = 0;
				aluSrc = 1;
				regWrite = 1;
			end
		11'b11111000000:
			begin
				aluOp = 4'b0010;//stur
				reg2Loc = 1;
				branch = 0;
				memRead = 0;
				memToReg = 0;
				memWrite = 1;
				aluSrc = 1;
				regWrite = 0;
			end
		11'b11111000010:
			begin
				aluOp = 4'b0010; //ldur
				reg2Loc = 0;
				branch = 0;
				memRead = 1;
				memToReg = 1;
				memWrite = 0;
				aluSrc = 1;
				regWrite = 1;
			end
		default:
			begin
				aluOp = 4'b0000; 
				reg2Loc = 0;
				branch = 0;
				memRead = 0;
				memToReg = 0;
				memWrite = 0;
				aluSrc = 0;
				regWrite = 0;
			end
	endcase
endmodule
		