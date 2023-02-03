module SevSeg(
    in,
    Num
    );
    input [3:0] in;
    output reg [6:0] Num;
    always @(in) begin
        case(in)
        4'b0000: Num=7'b1000000;
        4'b0001: Num=7'b1111001;
        4'b0010: Num=7'b0100100;
        4'b0011: Num=7'b0110000;
        4'b0100: Num=7'b0011001;
        4'b0101: Num=7'b0010010;
        4'b0110: Num=7'b0000010;
        4'b0111: Num=7'b1111000;
        4'b1000: Num=7'b0000000;
        4'b1001: Num=7'b0010000;
        4'b1010: Num=7'b0001000;
        4'b1011: Num=7'b0000011;
        4'b1100: Num=7'b1000110;
        4'b1101: Num=7'b0100001;
        4'b1110: Num=7'b0000110;
        4'b1111: Num=7'b0001110;
        endcase
    end
endmodule

