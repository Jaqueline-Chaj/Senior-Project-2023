`timescale 1ns / 1ps

`define STATE_IDLE (3'b000)
`define STATE_B1 (3'b001)
`define STATE_B2 (3'b010)
`define STATE_B3 (3'b011)
`define STATE_B4 (3'b100)
`define ADDR_MASK (8'b00001111)

module CMDproc(
    input logic clk,
    input logic reset, 
    input logic FIFO_RTS,
    input logic [7:0]inData,
    output logic PROC_RTR,
    output logic REG_WE,
    output logic [31:0]outData
    );
    
    logic [32:0]byte1, byte2, byte3, byte4;
    logic [31:0]tempData;
    logic [3:0]regAddr;
    logic [3:0]state;
    logic FIFO_XFC;
    assign FIFO_XFC = FIFO_RTS && PROC_RTR;

//state transition logic    
always_ff @ (posedge clk)  
begin
    if (reset)
        state <= `STATE_IDLE;
    else if (state == `STATE_IDLE && FIFO_XFC)
    begin
        state <= `STATE_B1;
    end    
    else if (state == `STATE_B1 && FIFO_XFC)
    begin
        state <= `STATE_B2;
    end 
    else if (state == `STATE_B2 && FIFO_XFC)
    begin
        state <= `STATE_B3;
    end 
    else if (state == `STATE_B3 && FIFO_XFC)
    begin
        state <= `STATE_B4;
    end 
    else if (state == `STATE_B4 && FIFO_XFC)
    begin
        state <= `STATE_IDLE;
    end
end

//always ready to receive
always_ff @ (posedge clk)
begin
    if (reset)
        PROC_RTR <= 0;
    else
        PROC_RTR <= 1;
end

//inData stored to a certain section of tempData based on state
always_ff @ (posedge clk)
begin
    if (reset)
    begin
        regAddr <= 0;
        byte1 <= 0;
        byte2 <= 0;
        byte3 <= 0;
        byte4 <= 0;
    end
    else if (state == `STATE_IDLE)
    begin
        //stores bottom 4 bits of inData to regAddr
        regAddr <= `ADDR_MASK && inData;
    end
    else if (state == `STATE_B1)
    begin
        byte1 <= inData;
    end
    else if (state == `STATE_B2)
    begin
        byte2 <= inData<<8;
    end    
    else if (state == `STATE_B3)
    begin
        byte3 <= inData<<16;
    end
    else if (state == `STATE_B4)
    begin
        byte4 <= inData<<24;;
    end    
end

//register write enable controller
always_ff @ (posedge clk)
begin
    if (reset)
        REG_WE <= 0;
    else if (state == `STATE_B4)
    begin
        REG_WE <= 1;
    end    
end

//writes the tempData to outData after all bytes received/temp stored
assign tempData = byte1 && byte2 && byte3 && byte4;
assign outData = tempData;



endmodule
