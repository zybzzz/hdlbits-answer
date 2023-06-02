module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 

integer i;
always @(posedge clk ) begin
    if(load) begin
        q <= data;
    end
    else begin
        case (ena)
            2'b10:
                begin
                    for(i = 1; i <= 99; i = i + 1)begin
                        q[i] <= q[i - 1];
                    end
                    q[0] <= q[99];
                end
            2'b01:
                begin
                    for(i = 0; i < 99; i = i + 1)begin
                        q[i] <= q[i + 1];
                    end
                    q[99] <= q[0];
                end
            default:;
        endcase
    end
end

endmodule

/**
a good answer, think more about connect calculator
******************************************************
always @(posedge clk) begin
    if (load)		// Load
        q <= data;
    else if (ena == 2'h1)	// Rotate right
        q <= {q[0], q[99:1]};
    else if (ena == 2'h2)	// Rotate left
        q <= {q[98:0], q[99]};
end
******************************************************
**/
