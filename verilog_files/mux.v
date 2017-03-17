module mux(input [31:0]in0, [31:0]in1, input s, output reg [31:0]out);

always @ *
begin
out=(s)?in1:in0;
end
endmodule
