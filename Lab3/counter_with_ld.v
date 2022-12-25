module counter_with_ld #(parameter n=8)(
    clk,
    rst,
    inc_cnt,
    ld,
    ld_value,
    co,
    count_out
);
input clk,inc_cnt,rst,ld;
input [n-1:0] ld_value;
output co;
output reg  [n-1:0] count_out;
always @(posedge clk) begin
    if(rst) begin
        count_out<={n{1'b0}}; 
    end
    else begin
        if (ld) count_out<=ld_value;
        if (inc_cnt)  begin
                count_out<=count_out+1;
        end
    end  
end
assign co=&{count_out};
endmodule
// module counter_with_ld(
//     clk,
//     rst,
//     ld_value_lsb,
//     ld_value_msb,
//     ld,
//     inc_cnt,
//     co,
//     count_out
// );
// input clk,inc_cnt,rst,ld;
// input [3:0]ld_value_lsb;
// input [5:0] ld_value_msb;
// output co;
// output reg  [8:0] count_out;
// always @(posedge clk) begin
//     if(rst) begin
//         count_out<={5'b0,ld_value_lsb}; 
//     end
//     else begin
//         if(co) count_out<={6'b0,ld_value_lsb};
//         if(ld) count_out[8:4] <= ld_value_msb;
//         else if(inc_cnt) count_out<=count_out+1;
//     end  
// end
// assign co=&{count_out};
// endmodule