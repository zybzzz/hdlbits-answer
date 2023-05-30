module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);


wire [15:0] res_low, res_high;
wire [31:0] inv_b;

assign inv_b = b ^ {32{sub}};

wire ca;
add16 add16_low(.a(a[15:0]),
                .b(inv_b[15:0]),
                .cin(sub),
                .sum(res_low),
                .cout(ca));

add16 add16_high(.a(a[31:16]),
                .b(inv_b[31:16]),
                .cin(ca),
                .sum(res_high),
                .cout());

assign sum = {res_high, res_low};

endmodule
