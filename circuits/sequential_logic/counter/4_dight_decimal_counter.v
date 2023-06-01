module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

wire [3:0] enable; 
generate
    assign enable[0] = 1'b1;
    genvar i;
    for(i = 1; i < 4; i = i + 1) begin:label1
        assign enable[i] = ((q[4 * (i - 1) + 3 : 4 * (i - 1)] == 4'd9) & enable[i - 1]);
    end
    for(i = 0; i < 4; i = i + 1) begin:label2
        dight_counter dight_counter_i(.clk(clk),
                                      .reset(reset),
                                      .enable(enable[i]),
                                      .cnt(q[4 * i + 3 : 4 * i]));
    end
endgenerate


assign ena = enable[3:1];
endmodule

module dight_counter (
    input clk,
    input reset,
    input enable,
    output reg [3:0] cnt
);

always @(posedge clk) begin
    if(reset) begin
        cnt <= 4'b0;
    end
    else begin
        if(enable) begin
            if(cnt < 4'd9)  cnt <= cnt + 1'b1;
            else cnt <= 4'b0;
        end
        else;
    end
end
    
endmodule
