`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 01:49:21 PM
// Design Name: 
// Module Name: LineEngine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module LineEngine(input logic clk,reset,
input logic[10:0] x1, y1, x2, y2,
input logic start_trigger,
input logic[23:0] color,
output logic line_wr_en,
output logic[19:0] waddr,
output logic[7:0] line_wr_data


    );
    
assign line_wr_data[7:5]=color[23:21];
assign line_wr_data[4:3]=color[15:14];
assign line_wr_data[2:0]=color[7:5];
logic[10:0] marx;
logic[9:0] mary;
logic[10:0] x_acc;
logic[10:0] y_acc;
logic[10:0] y_acc_neg;
logic line_state;
always_ff@(posedge clk) begin  //Sets the conditions for the state machine to progress

    if(reset) begin
        line_state<=0;
        end
    else  begin
        if(start_trigger)
            line_state<=1;
        else if(marx==x2 && mary==y2)
            line_state<=0;
    end
end
logic[10:0] xdiff, ydiff;
assign xdiff=x2-x1;
assign ydiff=y2-y1;

logic[10:0] ydiffabs;

always@(ydiff) begin
if(ydiff[10]==1'b1) //Absolute value
    ydiffabs=-ydiff;
else
    ydiffabs=ydiff;   
 
end
logic[1:0] linecase;
 
always@(posedge clk) begin   //Detirmining case
   if(xdiff>ydiffabs)begin
        if(ydiff[10] ==0 )begin
            linecase<=2'b00; end
        else begin
            linecase<=2'b01;end
    end
    else begin 
       if(ydiff[10]==0)begin
            linecase<=2'b10; end
        else begin
            linecase<=2'b11;end
   end
end
logic[11:0] x_compare, y_compare, x_neg_compare, y_neg_compare;

always@(posedge clk) begin   //This is the clock incremenation.  Increments the control counter.
if(reset || line_state==0) begin
        marx<=x1;
        mary<=y1;
        y_acc<=xdiff;
        x_acc<=ydiffabs;
       
        end
        
else if(line_state==1) begin
    case(linecase)
    2'b00: begin  //big x, positive y
        if(marx<x2) begin
            marx<=marx+1; end
        y_acc<=y_acc+2*ydiff;
    end
   2'b01: begin //big x, negative y(We reflect over x axis for algorithm but continue to decrement y)
        if(marx<x2) begin
            marx<=marx+1; end;
        y_acc<=y_acc+2*ydiffabs;
    end
   2'b10: begin  //Small x, positive y
        if(mary  <  y2) mary<=mary+1;
        x_acc<=x_acc+2*xdiff;
    
        end
   2'b11: begin  //Small x, negative y
        if(mary  >  y2) mary<=mary-1;
        x_acc<=x_acc+2*xdiff; end
   endcase
    end
end


always @(y_acc, x_acc)  begin   //Big x trakcer:  Updates mary based on when marx increments.
   if (~(reset || line_state==0)) begin    
    case(linecase)
       
    2'b00: begin  //big x, positive y
        if(y_acc>2*xdiff) begin 
            mary=mary+1;
            y_acc<=(y_acc-2*xdiff);end
        end
   2'b01: begin //big x, negative y(We reflect over x axis for algorithm but continue to decrement y)
         if(y_acc>2*xdiff) begin
            mary=mary-1;
            y_acc=(y_acc-2*xdiff);end
        end
   2'b10: begin
        if(x_acc>2*ydiff)begin
            marx=marx+1;
           x_acc=x_acc-2*ydiff; end
    end
    
    2'b11: begin
       if(x_acc>2*ydiffabs)begin
            marx=marx+1;
           x_acc=x_acc-2*ydiffabs; end
    end

        
    endcase
    end
end


logic[19:0] prod;
assign prod=mary * 5;
assign waddr= {prod, 8'b0} +marx;

assign line_wr_en=line_state;
endmodule
