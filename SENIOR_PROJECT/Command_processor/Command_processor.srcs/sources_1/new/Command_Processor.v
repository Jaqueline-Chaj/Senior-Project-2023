`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2023 03:27:12 PM
// Design Name: 
// Module Name: Command_Processor
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


module Command_Processor(
input clk, reset,
input[7:0] D,
input RST_FIFO,
output RTR_FIFO,
output D_OUT[7:0], 
output ADDR, 
output w_e //Write enable

    );
logic[3:0] mode;
always@(D[7:4]) begin   //THIS CASE STATEMENT WILL NEED TO BE EDITED!!
case (D[7:4])
    4'b0000: mode = RegWrite;
    4'b0001: mode=RectFill;
    default: mode=RegWrite;
    
    
  
endcase
end
logic[2:0] S, NX_S;

logic S0, S1, S2, S3, S4;

assign S0=3'b000;
assign S1=3'b001;
assign S2=3'b010;
assign S3=3'b011;
assign S4=3'b100;



always @(posedge clk)
    XFC<=RST_FIFO & RTR_FIFO;

//REg Write state machine
always_ff @ (posedge clk) begin
S <= NX_S;
if(reset)
    S<=0;
else begin
    if(S==S0) begin
        if(XFC && mode==RegWrite)
            NX_S<=S1;
        else
            NX_S<=S0;
    end 
   else if(S==S1) begin
        if(XFC)
            NX_S<=S2;
        else
            NX_S<=S1;
    end 
    else if(S==S2) begin
        if(XFC)
            NX_S<=S3;
        else
            NX_S<=S2;
    end 
     else if(S==S3) begin
        if(XFC)
            NX_S<=S4;
        else
            NX_S<=S3;
    end 
     else if(S==S4) begin
            NX_S<=S0;
    end 
end
end

logic register[31:0]
always_ff@(S) begin 
    if(S==S1)
        D_OUT[7;0]
    
    
    

    
    
endmodule
