module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

reg [7:0] q;

wire [2:0] idx;
assign idx = {A, B, C};
assign Z = q[idx];

always @(posedge clk ) begin
    if(enable) begin
        q <= {q[6:0], S};
    end
    else;    
end

endmodule
