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
// Register #(.n(8)) pwm_reg(.d_in(in_data), .rst(rst), .ld(ld_reg), .clk(clk),.init(8'b0), .d_out(reg_out));

assign out_pwm=(cnt_out <= in_data) ? 1'b1 : 1'b0;
// always @(cnt_out,cout,reg_out) begin
//     // ld_reg=1'b0;
//     out_pwm=1'b0;

//     // if(cout) ld_reg=1'b1;
//     if(cnt_out <= reg_out) out_pwm=1'b1;
// end
endmodule