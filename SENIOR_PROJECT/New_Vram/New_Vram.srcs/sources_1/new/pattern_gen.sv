`timescale 1ns / 1ps



module pattern_gen(
output[19:0] waddr,
input reset,clk,
output[7:0] wr_vram

    );
logic[10:0] mx;
logic[9:0]  my;  

reg[19:0] waddr;
reg[7:0] wr_vram;
logic mb_x;
logic mb_y;


assign mb_x=mx[4];
assign mb_y=my[4];  
always@(posedge clk) begin
    if(reset) begin
        waddr<=0;
        mx<=0;
        my<=0;
    end
    else if(mx!=1279 | my !=719) begin
        waddr<=waddr+1;
        if(mx<1279)
            mx<=mx+1;
        else begin
            mx<=0;
            my<=my+1;
            
        end
    end
    
    if(mb_x==mb_y) 
        wr_vram<=8'hFF;
    else 
        wr_vram<=8'h00;
end
endmodule
