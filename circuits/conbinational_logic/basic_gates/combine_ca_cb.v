module top_module (input x, input y, output z);

wire w1, w2, w3, w4;
ca ca_u1(x, y, w1);
cb cb_u1(x, y, w2);
ca ca_u2(x, y, w3);
cb cb_u2(x, y, w4);

assign z = (w1 | w2) ^ (w3 & w4);

endmodule


module ca (input x, input y, output z);

assign z = (x ^ y) & x;

endmodule

module cb ( input x, input y, output z );

assign z = ~(x ^ y);

endmodule