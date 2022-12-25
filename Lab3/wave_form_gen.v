module wave_form_gen(
    clk,
    rst,
    ld_reg,
    inc_cnt,
    phase_cntrl,
    sel_func,
    wave_out_
);
input clk,rst,ld_reg,inc_cnt;
input [1:0] phase_cntrl;
input [2:0] sel_func;
wire [7:0] cnt,out_core,DDS_out;
output [7:0] wave_out_;
wire sel_and,co;

assign sel_and=sel_func[2] & sel_func[1] & ~sel_func[0];
wave_gen_core wfg_core(.clk(clk),.rst(rst),.ld_reg(ld_reg),.sel_func(sel_func),.cnt(cnt),.out(out_core));
DDS DDS_gen(.clk(clk),.rst(rst),.ld_reg(ld_reg),.phase_cntrl(phase_cntrl),.DDS_out(DDS_out));
Mux2to1 mux(.wave_out(out_core), .DDS_out(DDS_out), .sel(sel_and), .y(wave_out_));
Counter cntr(.clk(clk),.rst(rst),.inc_cnt(inc_cnt),.co(co),.count_out(cnt));

endmodule