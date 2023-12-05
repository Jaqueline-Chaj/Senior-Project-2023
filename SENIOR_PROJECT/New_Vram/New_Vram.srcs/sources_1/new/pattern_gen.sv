`timescale 1ns / 1ps



module pattern_gen(
output[19:0] waddr,
input reset,clk,
output[7:0] wr_vram,
input sw

    );
logic[10:0] mx;
logic[9:0]  my;  

reg[19:0] waddr;
reg[7:0] wr_vram;
logic mb_x;
logic mb_y;
logic mb_cx;
logic mb_cy;

assign mb_x=mx[4];
assign mb_y=my[4];  
assign mb_cx=mx[7];
assign mb_cy=my[5];
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
    
   
end


always@(posedge clk) begin
    if(sw) begin
        if(mb_x==mb_y) begin 
            wr_vram<=8'hE0; end
        else begin
            wr_vram<=8'h1C; end
    end
    else begin
         if(mb_cx==mb_cy) 
            wr_vram<=8'hFF;
        else 
            wr_vram<=8'hE0;
    end
    
        
    
end
endmodule
