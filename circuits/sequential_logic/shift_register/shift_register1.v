module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

reg [3:0] sr;
assign out = sr[0];

always @(posedge clk ) begin
    if(!resetn) begin
        sr <= 4'b0;
    end
    else begin
        sr <= {in, sr[3:1]};
    end
    
end

endmodule
