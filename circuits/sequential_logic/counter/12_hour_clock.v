module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

//ss
dight_counter dight_counter_ss(.clk(clk),
                               .reset(reset),
                               .enable(1'b1),
                               .show_cnt(ss));

//mm
wire mm_enable;
assign mm_enable = (ss == 8'h59) & ena; 
dight_counter dight_counter_mm(.clk(clk),
                               .reset(reset),
                               .enable(mm_enable),
                               .show_cnt(mm));
//am
wire am_enable;
assign am_enable= (mm == 8'h59) & mm_enable;
// wire [7:0] hh_am;
dight_counter  #(.begin_cnt(1),
                 .cnt_step(12),
                 .mode(1))
dight_counter_am
                (.clk(clk),
                .reset(reset),
                .enable(am_enable),
                .show_cnt(hh));
assign pm = (hh == 8'h11) & am_enable;
//pm
// wire pm_enable;
// assign pm_enable = (mm == 7'd59) & ena;
// wire [7:0] hh_pm;
// dight_counter  #(.begin_cnt(1),
//                  .cnt_step(12))
// dight_counter_pm
//                 (.clk(clk),
//                 .reset(reset),
//                 .enable(pm_enable),
//                 .cnt(hh_pm));

//out
// initial begin
//     pm = 7'd0;
// end
// always @(posedge clk) begin
//     if((hh_am == 7'd11 || hh_pm == 7'd12) && am_enable)
//         pm = ~pm;

// end
// // assign hh = ({8{pm == 1'b0}} & hh_am)
//           | ({8{pm == 1'b1}} & hh_pm);
endmodule


module dight_counter (
    input clk,
    input reset,
    input enable,
    output [7:0] show_cnt
);

parameter begin_cnt = 0;
parameter cnt_step = 60;
parameter mode = 0; // 0 for mm ss 1 for hh

reg [7:0] cnt; 
always @(posedge clk) begin
    if(reset) begin
        if(mode == 0) cnt <= begin_cnt;
        else if(mode == 1) cnt <= begin_cnt + (cnt_step - 1);
        else;
    end
    else begin
        if(enable) begin
            if(cnt < begin_cnt + (cnt_step - 1))  cnt <= cnt + 1'b1;
            else cnt <= begin_cnt;
        end
        else;
    end
end

reg [3:0] high_d;
reg [3:0] low_d;
assign show_cnt = {high_d, low_d};
always @(posedge clk ) begin
    if(reset) begin
        if(mode == 0) begin
            high_d <= 4'd0;
            low_d <= 4'd0;
        end
        else if(mode == 1) begin
            high_d <= 4'd1;
            low_d <= 4'd2;
        end
        else;
    end
    else begin
        if(enable) begin
            if(cnt < begin_cnt + (cnt_step - 1)) begin
                if(low_d < 4'd9) begin
                    low_d <= low_d + 1'b1;
                end
                else begin
                    high_d <= high_d + 1'b1;
                    low_d <= 0; 
                end
            end
            else begin
                if(mode == 0) begin
                    high_d <= 4'd0;
                    low_d <= 4'd0;
                end
                else if(mode == 1) begin
                    high_d <= 4'd0;
                    low_d <= 4'd1;
                end
                else;
            end
        end
        else;
    end
end




    
endmodule

