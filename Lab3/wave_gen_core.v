module wave_gen_core(
    clk,
    rst,
    sel_func,
    phase_cntrl,
    out
);

input clk,rst;
input [2:0] sel_func;
wire [7:0] cnt;
input [1:0] phase_cntrl;
output reg [7:0] out;
wire [7:0] reciprocal_out,square_out,triangle_out,full_wave_out,half_wave_out,DDS_out;
wire signed [7:0] sine_out;
wire co;

Counter cntr(.clk(clk),.rst(rst),.inc_cnt(1'b1),.co(co),.count_out(cnt));

Reciprocal reciprocal_wave(.clk(clk),.cnt(cnt),.reciprocal_out(reciprocal_out));
square square_wave(.clk(clk),.cnt(cnt),.square_out(square_out));
triangle triangle_wave(.clk(clk),.cnt(cnt),.triangle_out(triangle_out));
sine sine_wave(.ld_reg(1'b1),.rst(rst),.clk(clk),.sine_out_offset(sine_out));
full_wave  full_sine_wave(.sine(sine_out),.full_wave_out(full_wave_out));
half_wave half_sine_wave(.sine(sine_out),.half_wave_out(half_wave_out));
DDS DDS_wave(.clk(clk),.rst(rst),.ld_reg(1'b1),.phase_cntrl(phase_cntrl),.DDS_out(DDS_out));

always @(*) begin
    case(sel_func)
    3'b000: out<=reciprocal_out;
    3'b001: out<=square_out;
    3'b010: out<=triangle_out;
    3'b011: out<=sine_out;
    3'b100: out<=full_wave_out;
    3'b101: out<=half_wave_out;
    3'b110: out<=DDS_out;
    default: out<=8'b0;
    endcase
end
endmodule