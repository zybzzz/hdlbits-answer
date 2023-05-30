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

wire [15:0] sum1, sum2;
add16 add16_sel_1(.a(a[31:16]),
                .b(b[31:16]),
                .cin(1'b0),
                .sum(sum1),
                .cout());

add16 add16_sel_2(.a(a[31:16]),
                .b(b[31:16]),
                .cin(1'b1),
                .sum(sum2),
                .cout());

my_mux my_mux_u(.in1(sum1),
                .in2(sum2),
                .sel(ca),
                .out(res_high));
                
assign sum = {res_high, res_low};

endmodule


module my_mux (
    input [15:0] in1,
    input [15:0] in2,
    input sel,
    output [15:0] out
);
    
assign out = (sel == 1'b0)? in1 : in2;

endmodule