module top_module (
    input clk,
    input in, 
    output reg out);

wire w;
assign w = out;
always @(posedge clk ) begin
    out <= w ^ in;
end

endmodule
