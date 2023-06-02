module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

reg [2:0] q;
assign LEDR = q;

always @(posedge KEY[0] ) begin
    case (KEY[1])
        1'b0:begin
            q[0] <= q[2];
            q[1] <= q[0];
            q[2] <= q[1] ^ q[2];
        end
        1'b1:begin
            q <= SW;
        end
        default:; 
    endcase
end

endmodule
