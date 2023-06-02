module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output reg [3:0] LEDR
); //
// bad answer
wire clk, E, L, w;
assign {w, L, E, clk} = KEY;

wire [3:0] w1;
generate
    MUXDFF MUXDFF_3(.in0(LEDR[3]),
                        .in1(w),
                        .sel(E),
                        .out1(w1[3]));
    genvar i;
    for(i = 0; i < 3; i = i + 1) begin:label1
        MUXDFF MUXDFF_i(.in0(LEDR[i]),
                        .in1(LEDR[i + 1]),
                        .sel(E),
                        .out1(w1[i]));
    end
endgenerate

wire [3:0] w2;
generate
    for(i = 0; i < 4; i = i + 1) begin:label2
        MUXDFF MUXDFF_ii (.in0(w1[i]),
                          .in1(SW[i]),
                          .sel(L),
                          .out1(w2[i]));
    end
endgenerate


always @(posedge clk) begin
    LEDR <= w2;
end

endmodule

module MUXDFF (
    input in0,
    input in1,
    input sel,
    output out1
);

assign out1 = (in0 & (sel == 1'b0))
            | (in1 & (sel == 1'b1));

endmodule
