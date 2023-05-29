module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    wire [24:0]t_v;
    assign t_v = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}};

    wire [24:0]b_v;
    assign b_v = {{5{a, b, c, d, e}}};

    assign out = ~(t_v ^ b_v);

endmodule
