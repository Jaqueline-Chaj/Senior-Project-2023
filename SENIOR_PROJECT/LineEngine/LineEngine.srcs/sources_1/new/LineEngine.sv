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
    
assign line_wr_data[7:5]=foreground_color[23:21];
assign line_wr_data[4:3]=foreground_color[15:14];
assign line_wr_data[2:0]=foreground_color[7:5];
logic[10:0] marx;
logic[9:0] mary;

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

logic ydiffabs;

always@(ydiff) begin
if(ydiff[10]==1'b1) //Absolute value
    ydiffabs=-ydiff;
else
    ydiffabs=ydiff;   
 
end
logic[1:0] linecase;
 
always@(posedge clk) begin   //Detirmining case
   if(xdiff>ydiffabs)begin
        if(ydiff>0)begin
            linecase<=2'b00; end
        else begin
            linecase<=2'b01;end
    end
    else begin 
       if(ydiff>0)begin
            linecase<=2'b10; end
        else begin
            linecase<=2'b11;end
   end
end


always@(posedge clk) begin
if(reset || line_state==0) begin
        marx<=x1;
        mary<=y1;
        y_acc<=xdiff;
        y_acc_neg<=-xdiff;
        x_acc<=x_diff;
        end
        
else if(line_state==1) begin
    case(linecase)
    00: begin
        marx<=marx+1;
        y_acc<=y_acc+2*ydiff;
        if(y_acc>=2*xdiff) begin
            mary<=mary+1;
            y_acc<=(y_acc-2*xidff);end
        end
   //Add 01, 10, 11 etc....
   endcase
end
end
endmodule
