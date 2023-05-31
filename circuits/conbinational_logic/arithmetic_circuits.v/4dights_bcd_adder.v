module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

wire [3:0] ca;
bcd_fadd bcd_fadd_0(.a(a[3:0]),
                    .b(b[3:0]),
                    .cin(cin),
                    .cout(ca[0]),
                    .sum(sum[3:0]));

generate
    genvar i;
    for(i = 1; i <= 3; i = i + 1) begin:label
        bcd_fadd bcd_fadd_i(.a(a[i * 4 + 3:i * 4]),
                    .b(b[i * 4 + 3:i * 4]),
                    .cin(ca[i - 1]),
                    .cout(ca[i]),
                    .sum(sum[i * 4 + 3:i * 4]));
    end
endgenerate

assign cout = ca[3];

endmodule

/*
module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
*/