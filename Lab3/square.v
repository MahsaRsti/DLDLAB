module square(
    clk,
    cnt,
    square_out
);
input clk;
input [7:0] cnt;
output reg [7:0] square_out;

always @(cnt) begin
    if(cnt < 8'd128) square_out<=8'd255;
    else square_out<=8'd0;
end
endmodule