module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

wire [7:0] q1, q2, q3;
my_dff8 my_dff8_u1(clk, d, q1);
my_dff8 my_dff8_u2(clk, q1, q2);
my_dff8 my_dff8_u3(clk, q2, q3);

reg [7:0] out_v;
assign q = out_v;

always @(*) begin
    case (sel)
        2'b00:
            out_v <= d;
        2'b01:
            out_v <= q1;
        2'b10:
            out_v <= q2;
        2'b11:
            out_v <= q3;
        default: ;
    endcase
end

endmodule
