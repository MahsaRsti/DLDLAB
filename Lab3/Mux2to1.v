module Mux2to1 #(parameter n=8) (
  wave_out, 
  DDS_out, 
  sel, 
  y
);
  input [n-1:0]     wave_out, DDS_out;
  input             sel;
  output [n-1:0]    y;
  
  assign y = (sel==1'b1) ? DDS_out : wave_out;
  
endmodule


