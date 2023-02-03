module Reciprocal(
    clk,
    cnt,
    reciprocal_out
);
input clk;
input [7:0] cnt;
output reg [7:0] reciprocal_out;

always @(cnt) begin
   reciprocal_out=8'd255/(8'd255-cnt);
end

endmodule

