`timescale 1ns/1ns
module wave_gen_core_tb();
    reg [2:0] wave_sel = 3'b001;
    reg [2:0] freq_sel=3'b001;
    reg [1:0] amp_sel=2'b10;
    reg [1:0] phase_cntrl=2'b01;
    wire [7:0] wave_gen_out,amp_out;
    wire DAC_out;
    // wire co;
    reg clk = 1'b0, rst, ld_reg=1'b1, inc_cnt=1'b1;
    // reg [1:0] phase_cntrl=2'b01;
quartus_sim tm(.wave(wave_gen_out),.amp(amp_out),.DAC_out(DAC_out),
               .clk(clk),.rst(rst),.SW({phase_cntrl,wave_sel,amp_sel,freq_sel}));
// wave_gen_core wgc(clk,rst,ld_reg,wave_sel,cnt,out);
// wave_form_gen wfg(clk,rst,ld_reg,inc_cnt,phase_cntrl,wave_sel,out);

// Counter cntr(clk,rst,inc_cnt,co,cnt);

always #5 clk = ~clk;

initial begin
    #3 rst = 1'b1;
    #5 rst = 1'b0;
    #2560000 wave_sel = 3'b011;
    #2560000 wave_sel = 3'b100;
    #2560000 wave_sel = 3'b101;
    #2560000 wave_sel = 3'b010;
    #2560000 wave_sel = 3'b000;
    #2560000 wave_sel = 3'b110;
    #2560000 $stop;
end
endmodule
