module ROM (
  adr,   
  out
  );

  input  [7:0]    adr;
  output [7:0]   out;
  
  reg [7:0] mem[0:255];
  
  initial begin
    $readmemb("sine.txt",mem);
  end

  assign out = mem[adr] ;
  
endmodule   