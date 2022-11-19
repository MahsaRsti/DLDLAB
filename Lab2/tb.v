module tb();
    reg clk=1,clkPB=1,rst,SerIn;
    wire [6:0] seven_num;
    wire SerOut,SerOutValid;

topmodule tp_module(
    clk,
    clkPB,
    rst,
    SerIn,
    SerOut,
    SerOutValid,
    seven_num
);
always #20 clk=~clk;
always #40 clkPB=~clkPB;
initial begin
    rst=1;
    #20 rst=0;
    #100 SerIn=1;
    #300 SerIn=0;
    #200 SerIn=1;
    #300 SerIn=1;
    #300 SerIn=1;
end

endmodule