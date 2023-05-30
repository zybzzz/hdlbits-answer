module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

bit_adder bit_adder_0(.a(a[0]),
                      .b(b[0]),
                      .cin(cin),
                      .sum(sum[0]),
                      .cout(cout[0]));

generate
    genvar i;
    for(i = 1; i < 100; i = i + 1) begin : label
        bit_adder bit_adder_i(.a(a[i]),
                            .b(b[i]),
                            .cin(cout[i - 1]),
                            .sum(sum[i]),
                            .cout(cout[i]));
    end
endgenerate

endmodule


module bit_adder (
    input a,
    input b,
    input cin,
    output cout,
    output sum
);

assign sum = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);

endmodule