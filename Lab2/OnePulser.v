`define init 2'b00
`define A 2'b01
`define B 2'b10
module onepulser(
    clk,
    long_pulse,
    single_pulse
);
input clk, long_pulse;
output reg single_pulse;

reg [1:0] ps=`init;
reg [1:0] ns;

always@(posedge clk) begin
    ps<=ns;
end

always @(*) begin
    ns=`init;
    case(ps)
        `init: ns<=(long_pulse) ? `A : `init;
        `A: ns<= `B;
        `B: ns<=(long_pulse) ? `B : `init;
    endcase
end

always @(ps) begin
    single_pulse=1'b0;
    if(ps==`A) single_pulse=1'b1;
end



endmodule