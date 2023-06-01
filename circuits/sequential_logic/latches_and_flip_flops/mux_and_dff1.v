module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

wire w;
assign w = {q_in & {1{L == 1'b0}}}
         | {r_in & {1{L == 1'b1}}};

always @(posedge clk ) begin
    Q <= w;
end

endmodule


