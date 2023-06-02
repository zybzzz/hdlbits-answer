module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 

reg [4:0] out_q;
assign q = out_q;



always @(posedge clk ) begin
    if(reset) begin
        out_q <= 5'b1;
    end
    else begin
        out_q[4] <= out_q[0] ^ 1'b0;
        out_q[3] <= out_q[4];
        out_q[2] <= out_q[3] ^ out_q[0];
        out_q[1] <= out_q[2];
        out_q[0] <= out_q[1];
    end
end

endmodule

