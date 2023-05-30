module top_module ( input clk, input d, output q );
    wire q1;
    my_dff(.clk(clk),
           .d(d),
           .q(q1));
    wire q2;
    my_dff(.clk(clk),
           .d(q1),
           .q(q2));

    my_dff(.clk(clk),
           .d(q2),
           .q(q));
endmodule