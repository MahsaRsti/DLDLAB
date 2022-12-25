module full_wave(
    sine,
    full_wave_out
);

input signed [7:0] sine;
output reg [7:0] full_wave_out;
always @(sine) begin
    if(sine[7]==1'b0) full_wave_out<=~sine;
    else if(sine[7]==1'b1) full_wave_out<=sine;
end

endmodule