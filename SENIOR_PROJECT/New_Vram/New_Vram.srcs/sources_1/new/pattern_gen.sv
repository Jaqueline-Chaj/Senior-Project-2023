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

//The states of the rectangle draw:  
logic [1:0] pat_state;

assign mb_x=mx[5];
assign mb_y=my[5];  


always_ff@(posedge clk) begin
    if(reset)
       pat_state<=0;
    else
    begin
//                          my==719
        if( (mx==1279 && my==719) || (pat_state == 2) )
            pat_state<=2;
        else
            pat_state <= 1;
    end
end

//TEMPORARY: 
assign wr_en=0;

//PERMANENT
//assign wr_en=pat_state[0];

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
   /* else
    begin
        waddr <= 0;
        mx <= 0;
        my <= 0;
    end */
   
end

logic[11:0] y_logic;
assign y_logic=my*5;
assign waddr={y_logic, 8'b0} + mx;






//Creates the initial test pattern
always_ff@(posedge clk) begin
        if(mb_x==mb_y) begin 
            wr_vram<=8'h1C; end //Blue
        else begin
            wr_vram<=8'h03; end
end    

endmodule
