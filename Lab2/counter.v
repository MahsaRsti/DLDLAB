module Counter(
    clk,
    rst_cnt,
    clk_en,
    inc_cnt,
    co,
    count_out
);

input clk,rst_cnt,clk_en,inc_cnt;
output co;
output reg  [3:0] count_out;

always @(posedge clk) begin
    if(rst_cnt) begin
        count_out<=4'b0; 
        //co<=1'b0;
    end
    else begin
        if(clk_en) begin
            if(inc_cnt)  begin
                // (count_out<=4'b1001)
                    count_out<=count_out+1;
                // else
                //     co=1'b1;
            end
        end  
    end
end
assign co=(count_out==4'b1001) ? 1'b1 : 1'b0;
endmodule