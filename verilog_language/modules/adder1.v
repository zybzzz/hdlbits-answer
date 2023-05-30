module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

wire [15:0] res_low, res_high;
wire ca;
add16 add16_low(.a(a[15:0]),
                .b(b[15:0]),
                .cin(1'b0),
                .sum(res_low),
                .cout(ca));

add16 add16_high(.a(a[31:16]),
                .b(b[31:16]),
                .cin(ca),
                .sum(res_high),
                .cout());

assign sum = {res_high, res_low};

endmodule