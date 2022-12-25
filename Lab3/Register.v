module Register #(parameter n=16) (
  d_in, 
  rst, 
  ld, 
  clk,
  init, 
  d_out
);
  input  [n-1:0]        d_in;
  input                 rst, ld, clk;
  input [15:0] init;
  output reg [n-1:0]    d_out;
  
  always @(posedge clk, posedge rst) begin
    if (rst==1'b1)
      d_out <= init;
    else if (ld)
      d_out <= d_in;
    else
      d_out <= d_out;
  end
  
endmodule