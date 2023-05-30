// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos );

// not use casez
    
always @(*) begin
    pos = (in[0]) ? 3'd0:
          (in[1]) ? 3'd1:
          (in[2]) ? 3'd2:
          (in[3]) ? 3'd3:
          (in[4]) ? 3'd4:
          (in[5]) ? 3'd5:
          (in[6]) ? 3'd6:
          (in[7]) ? 3'd7:
          3'd0;
end


endmodule