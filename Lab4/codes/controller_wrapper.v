`define START 3'b000
`define A 3'b001
`define B 3'b010
`define C 3'b011
`define D 3'b100
`define E 3'b101
module controllerr(
    clk,
    rst,
    start,
    eng_done,
    co,
    eng_start,
    done,
    rst_count,
    inc_count
);
input clk,rst,start,eng_done,co;
output reg eng_start,done,rst_count,inc_count;
reg [2:0] ps;
reg [2:0] ns;
always@(posedge clk) begin
    if(rst)
        ps<=`START;
    else
        ps<=ns;
end
always @(*) begin
    case(ps)
        `START: ns<=(~start) ? `START : `A;
        `A: ns<= (start) ? `A : `B;
        `B: ns<= (co) ? `START : `C;
        `C: ns<= (~eng_done) ? `C : `D;
        `D: ns<= `E;
        `E: ns<= (~start) ? `E : `A;
    endcase
end
always @(ps) begin
    {eng_start,done,rst_count,inc_count}<=4'b0000;
    case(ps)
        `START : begin done<=1'b1;
                        rst_count<=1'b1;
        end 
        `B: eng_start<=1'b1;
        `D: inc_count<=1'b1;
    endcase
end
endmodule