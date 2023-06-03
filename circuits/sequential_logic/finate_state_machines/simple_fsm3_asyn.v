// module top_module(
//     input clk,
//     input in,
//     input areset,
//     output reg out); //

// reg [1:0] state;
// localparam A = 2'b00;
// localparam B = 2'b01;
// localparam C = 2'b10;
// localparam D = 2'b11;

// always @(posedge clk or posedge areset) begin
//     if(areset) begin
//         state <= A;
//     end
//     else begin
//         case (state)
//             A: begin
//                 if(in == 1'b0) state <= A;
//                 else state <= B; 
//             end
//             B: begin
//                 if(in == 1'b0) state <= C;
//                 else state <= B; 
//             end
//             C: begin
//                 if(in == 1'b0) state <= A;
//                 else state <= D; 
//             end
//             D: begin
//                 if(in == 1'b0) state <= C;
//                 else state <= B; 
//             end
//             default: state <= A; 
//         endcase
//     end
// end

// always @(posedge clk or posedge areset) begin
//     if(areset) begin
//         out <= 1'b0;
//     end
//     else begin
//         if(state == D) out <= 1'b1;
//         else out <= 1'b0;
//     end
// end

// endmodule

module top_module(
    input clk,
    input in,
    input areset,
    output out); //

reg [1:0] state, state_n;
localparam A = 2'b00;
localparam B = 2'b01;
localparam C = 2'b10;
localparam D = 2'b11;

always @(posedge clk or posedge areset) begin
    if(areset) begin
        state <= A;
    end
    else begin
        state <= state_n;
    end
end

always @(*) begin
    case (state)
        A: begin
            if(in == 1'b0) state_n = A;
            else state_n = B; 
        end
        B: begin
            if(in == 1'b0) state_n = C;
            else state_n = B; 
        end
        C: begin
            if(in == 1'b0) state_n = A;
            else state_n = D; 
        end
        D: begin
            if(in == 1'b0) state_n = C;
            else state_n = B; 
        end
        default: state_n = A; 
    endcase
end

assign out = (state == D);


endmodule

