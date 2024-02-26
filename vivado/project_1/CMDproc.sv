`timescale 1ns / 1ps

`define STATE_IDLE (3'b000)
`define STATE_B1 (3'b001)
`define STATE_B2 (3'b010)
`define STATE_B3 (3'b011)
`define STATE_B4 (3'b100)

module CMDproc(
    input logic clk,
    input logic reset, 
    input logic HOST_RTS,
    input logic [7:0]HOST_DATA,
    output logic HOST_RTR,
    output logic REG_WE,
    output logic [31:0]REG_DATA,
    output logic [3:0] ENGINE_ID,
    output logic [3:0] REG_ADDR
    );
    
    logic [2:0]prevState;
    logic [31:0]tempData;
    logic [2:0]state;
    logic FIFO_XFC;
    assign FIFO_XFC = HOST_RTS && HOST_RTR;

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

//RTR logic
always_ff @ (posedge clk)
begin
    if (reset)
        HOST_RTR <= 0;
    else
        HOST_RTR <= 1;
end

//inData stored to a certain section of tempData based on state
always_ff @ (posedge clk)
begin
    if (reset)
    begin
        ENGINE_ID <= 0;
        REG_ADDR <= 0;
        tempData <= 0;
    end
    else if (state == `STATE_IDLE && FIFO_XFC)
    begin
        //writes out enginer_id and reg_addr from the first byte
        ENGINE_ID <= HOST_DATA [7:4];
        REG_ADDR <= HOST_DATA [3:0];
    end
    else if (state == `STATE_B1 && FIFO_XFC)
    begin
        tempData[7:0] <= HOST_DATA;
    end
    else if (state == `STATE_B2 && FIFO_XFC)
    begin
        tempData[15:8] <= HOST_DATA;
    end    
    else if (state == `STATE_B3 && FIFO_XFC)
    begin
        tempData[23:16] <= HOST_DATA;
    end
    else if (state == `STATE_B4 && FIFO_XFC)
    begin
        tempData[31:24] <= HOST_DATA; 
    end    
end

always_ff @ (posedge clk)
begin
    if (reset) 
        prevState <= 0;
    else
        prevState <= state;
end


//writes the tempData to outData after all bytes received/temp stored
assign REG_DATA = tempData;
assign REG_WE = (state == `STATE_IDLE) && (prevState == `STATE_B4);


endmodule
