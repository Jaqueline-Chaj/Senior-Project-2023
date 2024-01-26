`timescale 1ns / 1ps



module pattern_gen(
output[19:0] waddr,
input reset,clk,
output[7:0] wr_vram,
input sw,sw1,
sw2,
sw3,
sw4,
sw5,
sw6,
sw7

    );
logic[10:0] mx;
logic[9:0]  my;  

reg[19:0] waddr;
reg[7:0] wr_vram;
logic mb_x;
logic mb_y;
logic mb_cx;
logic mb_cy;
logic mb_dx;
logic mb_dy;
logic mb_ex;
logic mb_ey;

assign mb_x=mx[5];
assign mb_y=my[5];  
assign mb_cx=mx[8];
assign mb_cy=my[5];
assign mb_dx=mx[8];
assign mb_dy=my[5];
assign mb_ex=mx[4];
assign mb_ey=my[6];


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
    else
    begin
        waddr <= 0;
        mx <= 0;
        my <= 0;
    end
   
end



logic[2:0] red_sw, blue_sw;
logic[1:0] green_sw;

logic[7:0] transposed_swt_color;
/*
   assign red_sw[2]=sw7;
   assign  red_sw[1]=sw6;
   assign red_sw[0]=sw6;
   assign blue_sw[2]=sw5;
   assign blue_sw[1]=sw4;
   assign blue_sw[1]=sw4;
   assign green_sw[1]=sw3;
   assign green_sw[0]=sw2;
   assign transposed_swt_color[7:5]=red_sw;
   assign transposed_swt_color[4:2]=blue_sw;
   assign transposed_swt_color[1:0]=green_sw;
*/

always@(posedge clk) begin
   if(sw1) begin
      if(sw) begin
        if(mb_x==mb_y) begin 
            wr_vram<=8'hE0; end //Red
        else begin
            wr_vram<=8'h1C; end
      end
      else begin
         if(mb_cx==mb_cy) 
            wr_vram<=8'hE0;
        else 
            wr_vram<=8'h1C;
      end
    
   end
   else begin
     if(sw)begin
      if(mb_dx==mb_dy) begin 
            wr_vram<=8'h1C; end 
         else begin
            wr_vram<=8'h03; end
     end
     else begin
         if(mb_ex==mb_ey) 
            wr_vram<=8'h1C;
        else 
            wr_vram<=8'h03;
     end
   end
   
end    
logic[3:0] S;
logic NX_S, CUR_S;
reg[3:0] S;
reg NX_S;
reg CUR_S;
logic S0,S1,S2,S3;
assign S0=S[0];
assign S1=S[1];
assign S2=S[2];
assign S3=S[3];


//Creating a state machine.  
always@(posedge clk) begin


end    
endmodule
