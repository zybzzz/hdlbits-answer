module top_module (
    input clk,
    input x,
    output z
); 
/*********************************************
when you instance module it is error to bind a reg
to the reg output. reg unlike the wire, it will generate
2 registers, and the status will update until next clock.
that may genarete some errors.
*********************************************/

reg q1, q2, q3;
initial begin
    q1 = 0;
    q2 = 0;
    q3 = 0;
end


always @(posedge clk ) begin
    q1 <= x ^ q1;
    q2 <= x & ~q2;
    q3 <= x | ~q3;
end

assign z = ~(q1 | q2 | q3);

// udff udff1(d1, clk, q1, nq1);
// udff udff2(d2, clk, q2, nq2);
// udff udff3(d3, clk, q3, nq3);



endmodule

// module udff(
//     input d,
//     input clk,
//     output reg q,
//     output reg nq
// );

// always @(posedge clk ) begin
//    q <= d;
//    nq <= ~d; 
// end

// endmodule