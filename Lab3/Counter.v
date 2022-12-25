module Counter #(parameter n=8)(
    clk,
    rst,
    inc_cnt,
    co,
    count_out
);
input clk,inc_cnt,rst;
output co;
output reg  [n-1:0] count_out;
always @(posedge clk) begin
    if(rst) begin
        count_out<={n{1'b0}}; 
    end
    else begin
        if(inc_cnt)  begin
                count_out<=count_out+1;
        end
    end  
end
// assign co=(count_out==8'd255) ? 1'b1 : 1'b0;
assign co=&{count_out};
endmodule


