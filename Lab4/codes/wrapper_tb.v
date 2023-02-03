`timescale 1 ps / 1 ps
module wrapper_tb();
 reg clk=1'b0;
 reg rst,start;
 wire [1:0] intpart;
 wire [15:0] fracpart;
 wire done;

ww TM(
    clk,
    rst,
    start,
    intpart,
    fracpart,
    done
);

always #20 clk <= ~clk;
    initial begin
        rst=1;
        #30 rst=0;
        #20 start=1'b1;
        #40 start=1'b0;
        #600
        #30000000 $stop;
    end


endmodule