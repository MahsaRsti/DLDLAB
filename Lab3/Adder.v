module Adder #(parameter n=16)(
  a, 
  b,  
  cout, 
  sum
);
  input  [n-1:0]     a, b;
  output            cout;
  output [n-1:0]    sum;
  
  assign {cout, sum} = a + b;
  
endmodule