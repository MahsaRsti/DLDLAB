module tb();
    reg clk=1,clkPB=1,rst,SerIn;
    wire [3:0] count_out;
    wire SerOut,SerOutValid;

top_module tp_module(
    clk,
    clkPB,
    rst,
    SerIn,
    count_out,
    SerOut,
    SerOutValid
);
always #20 clk=~clk;
always #40 clkPB=~clkPB;
initial begin
    rst=1;
    #20 rst=0;
    #100 SerIn=1;
    #300 SerIn=0;
    #100 SerIn=1;
    #300 SerIn=1;
    #300 SerIn=1;
end

endmodule