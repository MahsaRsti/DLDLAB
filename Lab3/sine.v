module sine(
    ld_reg,
    rst,
    clk,
    sine_out_offset
);
input clk,rst,ld_reg;
output signed [7:0] sine_out_offset;
wire [15:0] init_sine=16'd30000;
wire [15:0] init_cos=16'd0;
wire signed [15:0] sine_out,cos_out,sin_adder,cos_sub;
wire signed [15:0] shifted_sin,shifted_cos;

Register sine(.d_in(sin_adder), .rst(rst), .ld(ld_reg), .clk(clk), .init(init_sine), .d_out(sine_out));
Register cos(.d_in(cos_sub), .rst(rst), .ld(ld_reg), .clk(clk), .init(init_cos), .d_out(cos_out));

assign shifted_sin={{6{sin_adder[15]}},sin_adder[15:6]};
assign shifted_cos={{6{cos_out[15]}},cos_out[15:6]};

Adder adder_sine(.a(sine_out),.b(shifted_cos),.cout(),.sum(sin_adder));
subtractor subtractor_cos(.a(cos_out),.b(shifted_sin),.res(cos_sub));

assign sine_out_offset= sine_out[15:8] + 8'd127;

endmodule