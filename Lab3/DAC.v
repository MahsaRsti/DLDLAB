module DAC(
    clk,
    rst,
    in_data,
    out_pwm
);
input clk,rst;
input [7:0] in_data;
output out_pwm;
wire cout;
reg ld_reg;
wire [7:0] cnt_out,reg_out;

Counter cnt(.clk(clk),.rst(rst),.inc_cnt(1'b1),.co(cout),.count_out(cnt_out));
assign out_pwm=(cnt_out <= in_data) ? 1'b1 : 1'b0;
endmodule

