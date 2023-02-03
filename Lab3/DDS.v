module DDS(
    clk,
    rst,
    ld_reg,
    phase_cntrl,
    DDS_out
);
input clk,rst,ld_reg;
input [1:0] phase_cntrl;
output [7:0] DDS_out;

wire [7:0] reg_out, adder_out;
Adder #(.n(8)) adder_reg(.a({6'b0,phase_cntrl}), .b(reg_out), .cout(), .sum(adder_out));
Register #(.n(8)) adr_reg(.d_in(adder_out), .rst(rst), .ld(ld_reg), .clk(clk),.init(16'b0), .d_out(reg_out));
// ROM sine_ROM(.adr(reg_out),.out(DDS_out));
sinROM sine_ROM(.address(reg_out),.clock(clk),.q(DDS_out));

endmodule

