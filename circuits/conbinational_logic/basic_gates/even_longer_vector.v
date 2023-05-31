module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );

generate
    genvar i;
    for (i = 0; i < 99; i = i + 1) begin:label1
        assign out_both[i] = in[i] & in[i + 1];
    end
    for (i = 1; i < 100; i = i + 1) begin:label2
        assign out_any[i] = in[i] | in[i - 1];
    end
    for (i = 0; i < 99; i = i + 1) begin:label3
        assign out_different[i] = in[i] ^ in[i + 1];
    end
    assign out_different[99] = in[99] ^ in[0];
endgenerate

endmodule
