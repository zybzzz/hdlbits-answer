module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg [3:0] q);

always @(posedge clk ) begin
    if(reset) begin
        q <= 4'b0;
    end
    else begin
        q <= q + 1'b1;
    end
end

endmodule
