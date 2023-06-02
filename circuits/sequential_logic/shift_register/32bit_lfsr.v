module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output reg [31:0] q
); 

integer i;
always @(posedge clk ) begin
    if(reset) begin
        q <= 32'b1;
    end
    else begin
        q[31] = q[0] ^ 1'b0;
        for (i = 0; i < 31; i = i + 1) begin
            if(i == 21 || i == 1 || i == 0) begin
                q[i] <= q[0] ^ q[i + 1];    
            end
            else begin
                q[i] <= q[i + 1];
            end
        end
    end
end

endmodule
