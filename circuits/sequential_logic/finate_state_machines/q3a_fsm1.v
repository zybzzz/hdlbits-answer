module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output reg z
);

reg [2:0] state;
localparam A = 3'd0;
localparam B = 3'd1;
localparam C = 3'd2;
localparam D = 3'd3;
localparam E = 3'd4;

always @(posedge clk ) begin
    if(reset) begin
        state <= A;
    end
    else begin
        case(state)
            A: begin
                if(s == 0)  state <= A;
                else if(s == 1) state <= B;
            end
            B: begin
                if(w == 0)  state <= B;
                else if(w == 1) state <= C;
            end
            C: begin
                if(w == 0)  state <= B;
                else if(w == 1) state <= D;
            end
            D: begin
                if(w == 0)  state <= B;
                else if(w == 1) state <= E;
            end
            E: begin
                if(w == 0)  state <= B;
                else if(w == 1) state <= E;
            end
            default: state <= A;
        endcase
    end
end


always @(posedge clk or posedge reset) begin
    if(reset) begin
        z <= 1'b0;
    end
    else begin
        if(state == E)  z <= 1'b1;
        else z <= 1'b0;
    end
end

endmodule
