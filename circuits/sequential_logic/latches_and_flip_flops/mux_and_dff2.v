module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);

wire w1;
assign w1 = {Q & {1{E == 1'b0}}}
          | {w & {1{E == 1'b1}}};
wire w2;
assign w2 = {w1 & {1{L == 1'b0}}}
          | {R & {1{L == 1'b1}}};

always @(posedge clk ) begin
    Q <= w2;
end
endmodule
