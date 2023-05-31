module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );

integer idx;
reg[7:0] sel_r;
reg out_b;
always @(*) begin
    sel_r = sel;
    idx = sel_r;
    out_b = in[idx];
end

assign out = out_b;


endmodule
