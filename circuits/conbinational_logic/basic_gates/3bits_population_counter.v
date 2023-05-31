module top_module( 
    input [2:0] in,
    output [1:0] out );
integer i;
reg [2:0] cnt;
always @(*) begin
    cnt = 0;
    for(i = 0; i < 3; i = i + 1)begin
        if(in[i]) cnt = cnt + 1;
    end
end

assign out = cnt;

endmodule
