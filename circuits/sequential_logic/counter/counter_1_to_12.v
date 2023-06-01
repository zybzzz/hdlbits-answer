module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
reg [4:0] cnt;
assign c_enable = enable;
//**it is important to use enable to control c_load to be 1
assign c_load = (reset || (cnt == 4'd11 && enable == 1'b1));
assign c_d = c_load;

count4 the_counter (clk, c_enable, c_load, c_d, Q/*, ... */ );
always @(posedge clk ) begin
    if(reset)begin
        cnt <= 4'd0;
    end
    else begin
        if(enable) begin
            if(cnt < 11) begin
                cnt <= cnt + 1'b1;
            end
            else begin
                cnt <= 4'd0;
            end
        end
        else;
    end
end

endmodule
