module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );

assign out = (a & {16{sel == 4'd0}})
           | (b & {16{sel == 4'd1}})
           | (c & {16{sel == 4'd2}})
           | (d & {16{sel == 4'd3}})
           | (e & {16{sel == 4'd4}})
           | (f & {16{sel == 4'd5}})
           | (g & {16{sel == 4'd6}})
           | (h & {16{sel == 4'd7}})
           | (i & {16{sel == 4'd8}})
           | ({16{sel > 4'd8}});

endmodule
