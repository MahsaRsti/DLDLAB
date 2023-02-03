module counter_wrapper(
    clk,
    rst,
    rst_count,
    inc_count,
    co,
    count_out
);
input clk,rst_count,inc_count,rst;
output co;
output reg  [7:0] count_out;
always @(posedge clk) begin
    if(rst_count | rst) begin
        count_out<=8'b0; 
    end
    else begin
            if(inc_count)  begin
                    count_out<=count_out+1;
            end
        end  
end
assign co=(count_out==8'b00000101) ? 1'b1 : 1'b0;
endmodule