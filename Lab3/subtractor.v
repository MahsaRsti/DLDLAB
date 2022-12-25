module subtractor(
    a,
    b,
    res
);
input [15:0] a,b;
output [15:0] res;

assign res=a-b;

endmodule