`define init 3'b000
`define A 3'b001
`define B 3'b010
`define C 3'b011
`define D 3'b100
`define FINAL 3'b101
module sequence_detector(
    rst,
    clk,
    clk_en,
    SerIn,
    co,
    SerOut,
    SerOutValid,
    inc_cnt,
    rst_cnt
);
input   rst,clk,clk_en,SerIn,co;
output reg  SerOutValid,inc_cnt,rst_cnt;
output SerOut;

reg [2:0] ps,ns;

always@(posedge clk) begin
    if(rst)
        ps<=`init;
    else
        ps<=ns;
end

always @(*) begin
    case(ps)
        `init: ns <= `A;
        `A: begin
            if (~clk_en | (~SerIn & clk_en)) ns <=`A;
            else if(SerIn & clk_en) ns<=`B;
        end
        `B: begin
            if(~clk_en | (SerIn & clk_en)) ns <=`B;
            else if(~SerIn & clk_en) ns <=`C;
        end
        `C: begin
            if(~clk_en) ns <=`C;
            else if(~SerIn & clk_en) ns <=`A;
            else if(SerIn & clk_en) ns <=`D;
        end
        `D: begin
            if(~clk_en) ns <=`D;
            else if(~SerIn & clk_en) ns <=`C;
            else if(SerIn & clk_en) ns <=`FINAL;
        end
        `FINAL: ns <= (co) ? `init : `FINAL;
    endcase
end

always @(ps) begin
    {SerOutValid,inc_cnt,rst_cnt}=3'b0;
    case(ps)
        `init: rst_cnt=1'b1;
        `FINAL:  {SerOutValid,inc_cnt}=2'b11;
    endcase
end

assign SerOut=(SerOutValid) ? SerIn : 1'bz;


endmodule