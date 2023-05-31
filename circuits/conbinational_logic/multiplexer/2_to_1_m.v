module top_module( 
    input a, b, sel,
    output out ); 

assign out = (a & {1{sel == 1'b0}})
           | (b & {1{sel == 1'b1}});

endmodule
