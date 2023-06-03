module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

reg state;
localparam A = 1'b0;
localparam B = 1'b1;
// fsm
always @(posedge clk or posedge areset) begin
    if(areset) begin
        state <= B;
    end
    else begin
        case (state)
            A: begin
                if(in == 1'b0) state <= B;
                // else if(in == 1'b1) state <= A;
                else;
            end 
            B: begin
                if(in == 1'b0) state <= A;
                // else if(in == 1'b1) state <= B;
                else;
            end
            default:; 
        endcase
    end
    // else;
end

// out
assign out = (state == B);

endmodule
