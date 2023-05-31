module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

assign out = (a & {100{sel == 1'b0}})
           | (b & {100{sel == 1'b1}});

endmodule
