module Amplitude_selector(
    amp_sel,
    amp_in,
    amp_out
);
input [1:0] amp_sel;
input [7:0] amp_in;
output [7:0] amp_out;

assign amp_out=amp_in>>amp_sel;

endmodule