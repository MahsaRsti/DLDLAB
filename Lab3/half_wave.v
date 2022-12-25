module half_wave(
    sine,
    half_wave_out
);

input signed [7:0] sine;
output reg [7:0] half_wave_out;
always @(sine) begin
    if(sine[7]==1'b0) half_wave_out<=8'd127;
    else if(sine[7]==1'b1) half_wave_out<=sine;
end

endmodule