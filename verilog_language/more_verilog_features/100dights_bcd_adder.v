module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

wire [99:0] temp_cout;
bcd_fadd bcd_fadd_0(.a(a[3:0]),
                    .b(b[3:0]),
                    .cin(cin),
                    .cout(temp_cout[0]),
                    .sum(sum[3:0]));

generate
    genvar i;
    for(i = 1; i < 100; i = i + 1) begin : label
        // integer t = i * 4;
        bcd_fadd bcd_fadd_i(.a(a[i * 4 + (4 - 1):i * 4]),
                    .b(b[i * 4 + (4 - 1):i * 4]),
                    .cin(temp_cout[i - 1]),
                    .cout(temp_cout[i]),
                    .sum(sum[i * 4 + (4 - 1):i * 4]));
    end
endgenerate

assign cout = temp_cout[99];

endmodule



// bcd module declaration
// module bcd_fadd (
//     input [3:0] a,
//     input [3:0] b,
//     input     cin,
//     output   cout,
//     output [3:0] sum );