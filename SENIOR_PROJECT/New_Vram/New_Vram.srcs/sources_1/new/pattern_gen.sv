`timescale 1ns / 1ps

module pattern_gen(
output[19:0] waddr,
input reset,clk,
output[7:0] wr_vram,
output wr_en

    );
logic[10:0] mx;
logic[9:0]  my;  

reg[19:0] waddr;
reg[7:0] wr_vram;
logic mb_x;
logic mb_y;

assign mb_x=mx[5];
assign mb_y=my[5];  


always_ff@(posedge clk) begin
if(reset)
   pat_state<=1;
else if(mx==1279 && my==719)
    pat_state<=0;
end

assign wr_en=~pat_state;
always@(posedge clk) begin
    if(reset || pat_state==0) begin
        waddr<=0;
        mx<=0;
        my<=0;
    end
    else if(pat_state==1) begin
        
            if(mx!=1279 | my !=719) begin
                if(mx<1279)
                    mx<=mx+1;
                else begin
                    mx<=0;
                    my<=my+1;
                end
            end
    end
    else
    begin
        waddr <= 0;
        mx <= 0;
        my <= 0;
    end
   
end

logic[11:0] y_logic;
assign y_logic=my*5;
assign waddr={y_logic, 8'b0} + mx;



//The states of the rectangle draw:  
logic pat_state_idle;   //Rectangle draw idle
logic pat_state_active; //Rectangle draw active
logic pat_state;



//Creates the initial test pattern
always_ff@(posedge clk) begin
        if(mb_x==mb_y) begin 
            wr_vram<=8'h1C; end //Blue
        else begin
            wr_vram<=8'h03; end
end    

endmodule
