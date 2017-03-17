`include "constant.v"
module pc(nextInst,clock,next,currentInst,pcNext,led_test,led_test2);
	
	input clock;
	input next;
	input [31:0]nextInst;
	output reg [31:0]currentInst;
	output reg [31:0]pcNext;
	output reg led_test;//Status LED, on means working
	output reg led_test2;//Switch LED
	reg [31:0]i;
	
	initial begin
		currentInst = 0;
		led_test = 1;
		pcNext = 1;
		led_test2 = next;
	end
	always @(posedge clock) begin
		if (nextInst == `NUMBER_OF_INSTRUCTION )
			begin
				led_test=0;//Turn off
			end
			
		else
			begin
				led_test = 1;//Turn on (stll fetching instruction)
				if (next == 0)
					begin
						currentInst = nextInst;
						pcNext = nextInst + 1;
					end
			end
		led_test2 = next;
	end
endmodule