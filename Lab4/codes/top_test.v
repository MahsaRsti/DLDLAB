module ww(
    CLOCK_50,
    rst, 
    start,
    intpart,
    fracpart,
    done
);
input CLOCK_50;
input rst,start;
output done;
// output [9:0] LEDR;
// output [6:0] HEX0,HEX1,HEX2,HEX3;
wire [15:0] out_rom;
wire eng_start,eng_done,co,inc_count,rst_count;
wire [7:0] address;
output  [1:0] intpart;
output [15:0] fracpart;
exponential exp_eng(
    .clk(CLOCK_50),
    .rst(rst),
    .start(eng_start),
    .x(out_rom), 
    .done(eng_done), 
    .intpart(intpart), 
    .fracpart(fracpart));
controllerr cntrlr(
    .clk(CLOCK_50),
    .rst(rst),
    .start(start),
    .eng_done(eng_done),
    .co(co),
    .eng_start(eng_start),
    .done(done),
    .rst_count(rst_count),
    .inc_count(inc_count)
);
counter_wrapper cnt(
    .clk(CLOCK_50),
    .rst(rst),
    .rst_count(rst_count),
    .inc_count(inc_count),
    .co(co),
    .count_out(address)
);
rom ROM(
	.address(address),
	.clock(CLOCK_50),
	.q(out_rom));
// SevSeg intpartt(
//     .in({intpart,fracpart[15:14]}),
//     .Num(HEX0)
//     );
// SevSeg frac15_12(
//     .in(fracpart[13:10]),
//     .Num(HEX1)
//     );
// SevSeg frac11_8(
//     .in(fracpart[9:6]),
//     .Num(HEX2)
//     );
// SevSeg frac7_4(
//     .in(fracpart[5:2]),
//     .Num(HEX3)
//     );
endmodule