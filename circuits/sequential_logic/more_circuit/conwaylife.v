module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

reg [15:0] m [15:0];
generate
    genvar i;
    for(i = 0; i < 16; i = i + 1) begin:label
        assign q[i * 16 + 15 : i * 16] = m[i][15 -: 16]; 
    end
endgenerate

integer j;
integer r, c;
integer cnt [15:0][15:0];
always @(posedge clk ) begin
    if(load) begin
        for(j = 0; j < 16; j = j + 1) begin
            m[j][0 +: 16] <= data[(j * 16) +:16];
        end
    end
    else begin
        for(r = 0; r < 16; r = r + 1) begin
            for(c = 0; c < 16; c = c + 1) begin
                cnt[r][c] = 0;
                if(r == 0 && c == 0) begin
                    cnt[r][c] = m[15][15] + m[15][0] + m[15][1]
                              + m[0][15] + m[0][1]
                              + m[1][15] + m[1][0] + m[1][1];
                end
                else if(r == 0 && c == 15) begin
                    cnt[r][c] = m[15][14] + m[15][15] + m[15][0]
                              + m[0][14] + m[0][0]
                              + m[1][14] + m[1][15] + m[1][0];
                end
                else if(r == 15 && c == 0) begin
                    cnt[r][c] = m[14][15] + m[14][0] + m[14][1]
                              + m[15][15] + m[15][1]
                              + m[0][15] + m[0][0] + m[0][1];
                end
                else if(r == 15 && c == 15) begin
                    cnt[r][c] = m[14][14] + m[14][15] + m[14][0]
                              + m[15][14] + m[15][0]
                              + m[0][14] + m[0][15] + m[0][0];
                end
                else if(r == 0) begin
                    cnt[r][c] = m[15][c - 1] + m[15][c] + m[15][c + 1]
                              + m[r][c - 1] + m[r][c + 1]
                              + m[r + 1][c - 1] + m[r + 1][c] + m[r + 1][c + 1];
                end
                else if(r == 15) begin
                    cnt[r][c] = m[r - 1][c - 1] + m[r - 1][c] + m[r - 1][c + 1]
                              + m[r][c - 1] + m[r][c + 1]
                              + m[0][c - 1] + m[0][c] + m[0][c + 1];
                end
                else if(c == 0) begin
                    cnt[r][c] = m[r - 1][15] + m[r - 1][c] + m[r - 1][c + 1]
                              + m[r][15] + m[r][c + 1]
                              + m[r + 1][15] + m[r + 1][c] + m[r + 1][c + 1];
                end
                else if(c == 15) begin
                    cnt[r][c] = m[r - 1][c - 1] + m[r - 1][c] + m[r - 1][0]
                              + m[r][c - 1] + m[r][0]
                              + m[r + 1][c - 1] + m[r + 1][c] + m[r + 1][0];
                end
                else begin
                    cnt[r][c] = m[r - 1][c - 1] + m[r - 1][c] + m[r - 1][c + 1]
                              + m[r][c - 1] + m[r][c + 1]
                              + m[r + 1][c - 1] + m[r + 1][c] + m[r + 1][c + 1];
                end
            end

            
        end

        for(r = 0; r < 16;r = r + 1) begin
            for(c = 0; c < 16; c = c + 1) begin
                m[r][c] <= ((cnt[r][c] <= 1 || cnt[r][c] >= 4) & 1'b0)
                         | ((cnt[r][c] == 2) & m[r][c])
                         | ((cnt[r][c] == 3) & 1'b1);
            end
        end
    end
end

endmodule
