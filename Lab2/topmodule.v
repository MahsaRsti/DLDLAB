module topmodule(
    clk,
    clkPB,
    rst,
    SerIn,
    //count_out,
    SerOut,
    SerOutValid,
    seven_num
);

input clk,clkPB,rst,SerIn;
wire [3:0] count_out;
output SerOut,SerOutValid;
output [6:0] seven_num;

wire clk_en,co,inc_cnt,rst_cnt;

onepulser oneplsr(
    .clk(clk),
    .long_pulse(clkPB),
    .single_pulse(clk_en)
);

sequence_detector seq_dtctr(
    .rst(rst),
    .clk(clk),
    .clk_en(clk_en),
    .SerIn(SerIn),
    .co(co),
    .SerOut(SerOut),
    .SerOutValid(SerOutValid),
    .inc_cnt(inc_cnt),
    .rst_cnt(rst_cnt)
);

Counter cnt(
    .clk(clk),
    .rst_cnt(rst_cnt),
    .clk_en(clk_en),
    .inc_cnt(inc_cnt),
    .co(co),
    .count_out(count_out)
);

SevSeg seven_seg(.Count_out(count_out), .Num(seven_num));

endmodule