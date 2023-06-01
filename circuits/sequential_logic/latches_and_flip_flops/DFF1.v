module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output reg q);

always @(posedge clk or posedge ar) begin
    if(ar) begin
        q <= 1'b0;
    end
    else if(clk) begin
        q <= d;
    end
    else;
end

endmodule
