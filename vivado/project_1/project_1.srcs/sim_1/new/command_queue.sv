`timescale 1ns / 1ps

module command_queue #(parameter DEPTH=16, WIDTH=8) (
        input clk,
        input reset,
    //Input interface 
        input logic IN_RTS,  // when 1, IN_DATA is valid
        input logic [WIDTH-1:0] IN_DATA,
        output logic IN_RTR,
    //Output interface 
        output logic OUT_RTS,   // when 1, OUT_DATA is valid
        output logic [WIDTH-1:0] OUT_DATA,
        input logic OUT_RTR
    );

logic [WIDTH-1:0] array [DEPTH-1:0];
logic [$clog2(DEPTH)-1:0] writeptr, next_write_ptr;
logic [$clog2(DEPTH)-1:0] readptr, next_read_ptr;
logic IF_FIFO_XFC;
logic FIFO_PROC_XFC;

assign next_write_ptr = writeptr + 1'b1;
assign next_read_ptr = readptr + 1'b1;
assign IN_RTR = (next_write_ptr != readptr); // not full
assign OUT_RTS = (writeptr != readptr);  // not empty
assign IN_XFC = IN_RTS && IN_RTR;
assign OUT_XFC = OUT_RTS && OUT_RTR;

//sets everything to 0 on reset
always_ff @ (posedge clk)
begin
    if(reset)
        for(int i = 0; i < DEPTH; i++)
        begin
            array[i] <= 0;
        end 
end

// writes data into a queue slot if not full and data is valid
always_ff @ (posedge clk)
begin
    if(reset)
        writeptr <= 0;
    else if(IN_XFC)
    begin
        array[writeptr] <= IN_DATA;
        writeptr <= next_write_ptr;
    end
end

// sends data to cmd proc if cmd proc is ready to receive and queue is not empty
always_ff @ (posedge clk) 
begin
    if(reset)
        readptr <= 0;
    else if(OUT_XFC)
    begin
        readptr <= next_read_ptr;
    end
end

assign OUT_DATA = array[readptr];

endmodule
