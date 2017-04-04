module aluController_test;

	wire [10:0]opcode;
	wire [31:0]segA;
	wire [7:0]segB;
	wire [31:0]segC;
	wire [25:0]branchTarget;
	wire [3:0]aluOp;
	wire reg2Loc;
	wire branch;
	wire memRead;
	wire memToReg;
	wire memWrite;
	wire aluSrc;
	wire regWrite;
	wire [31:0]aluOut;
	wire [31:0]memOut;
	wire [31:0]regWriteData;
	wire [31:0]regOut2;
	wire [31:0]aluIn2;
	wire [31:0]regRead2;
	wire [31:0]aluIn1;
	reg [31:0]inst;
	reg [31:0]pcNext;
	wire [31:0]nextInst;
	reg [31:0]currentInst;
	reg next;

	decoder decode1(inst, opcode, segA, segB, segC, branchTarget);
	controller control1(opcode, reg2Loc, branch, memRead, memToReg,aluOp, memWrite, aluSrc, regWrite);
	mux reg2Loc1(segC, segA, reg2Loc, regRead2);
	mux branch1(pcNext, aluOut, branch, nextInst);
	mux memToReg1(aluOut, memOut, memToReg, regWriteData);
	mux aluSrc1(regOut2, segC, aluSrc, aluIn2);
	registers reg1(segB, regRead2, segA, regWrite, regWriteData, aluIn1, regOut2,regLED1,regLED2,regLED3,regLED4);
	alu alu1(aluIn1, aluIn2, aluOp, currentInst, aluOut);
	memory dataMem(memRead, memWrite, regOut2, aluOut, memOut,led1,led2,led3,led4);
	
	initial
	begin
		inst =  32'b10010001000000100000011111100001;
		next =1;
		pcNext = 1;
		currentInst = 0;
		#100;
		next = 0;
		#100;
		next = 1;
		#100;
		next = 0;
	end
endmodule