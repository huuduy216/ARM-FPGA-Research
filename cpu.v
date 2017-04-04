module cpu(clock,rLED1,rLED2,rLED3,rLED4,mLED1,mLED2,mLED3,mLED4,aluOut,opcode,segA,segB,segC,inst);
	
	input clock;
	output wire rLED1;
	output wire rLED2;
	output wire rLED3;
	output wire rLED4;
	output wire mLED1;
	output wire mLED2;
	output wire mLED3;
	output wire mLED4;
	
	output wire [10:0]opcode;
	output wire [9:0]segA;
	output wire [7:0]segB;
	output wire [9:0]segC;
	wire [31:0]extendedSegA;
	wire [31:0]extendedSegC;
	wire [25:0]branchTarget;
	wire [3:0]aluOp;
	wire reg2Loc;
	wire branch;
	wire memRead;
	wire memToReg;
	wire memWrite;
	wire aluSrc;
	wire regWrite;
	output wire [31:0]aluOut;
	wire [31:0]memOut;
	wire [31:0]regWriteData;
	wire [31:0]regOut2;
	wire [31:0]aluIn2;
	wire [31:0]regRead2;
	wire [31:0]aluIn1;
	output wire [31:0]inst;
	wire [31:0]pcNext;
	wire [31:0]nextInst;
	wire [31:0]currentInst;
	
	pc pc1(clock,nextInst, currentInst, pcNext);
	instMem instMem1(currentInst, inst);
	decoder decode1(inst, opcode, segA, segB, segC, branchTaarget);
	controller control1(opcode, reg2Loc, branch, memRead, memToReg,aluOp, memWrite, aluSrc, regWrite);
	assign extendedSegA = segA;//sign extension
	assign extendedSegC = segC;//sign extension
	mux reg2Loc1(extendedSegC, extendedSegA, reg2Loc, regRead2);
	mux branch1(pcNext, aluOut, branch, nextInst);
	mux memToReg1(aluOut, memOut, memToReg, regWriteData);
	mux aluSrc1(regOut2, extendedSegC, aluSrc, aluIn2);
	registers reg1(segB, regRead2, regWrite, segA, regWriteData, aluIn1, regOut2,rLED1,rLED2,rLED3,rLED4);
	alu alu1(aluIn1, aluIn2, aluOp, currentInst, aluOut);
	memory dataMem(memRead, memWrite, regOut2, aluOut, memOut,mLED1,mLED2,mLED3,mLED4);
	
endmodule