module triangle(
    clk,
    cnt,
    triangle_out
);
input clk;
input [7:0] cnt;
output reg [7:0] triangle_out;

always @(cnt) begin
    if(cnt < 8'd128) triangle_out<=cnt<<1;
    else triangle_out<=8'd255-cnt<<1;
end

endmodule

