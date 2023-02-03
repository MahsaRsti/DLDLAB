module Frequency_selector(
    clk,
    rst,
    ld_value,
    freq_out
);
    input clk,rst;
    input [2:0] ld_value;
    output freq_out;
    wire [8:0] count_out;
    wire co;

counter_with_ld  #(.n(9)) freq_cnt(.clk(clk),.rst(rst),.inc_cnt(1'b1),.ld(co),
                                   .ld_value({6'b0,ld_value}),.co(co),.count_out(count_out));
assign freq_out=co;
endmodule

