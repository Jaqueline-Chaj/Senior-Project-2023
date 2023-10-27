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

reg [WIDTH-1:0] array [DEPTH-1:0];
reg [$clog2(DEPTH):0] writeptr;
reg [$clog2(DEPTH):0] readptr;

assign IN_RTR = ((writeptr + 1'b1) != readptr); // not full
assign OUT_RTS = (writeptr != readptr);  // not empty

//sets everything to 0 on reset
always_ff @ (posedge clk)
begin
    if(reset)
        OUT_DATA <= 0;
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
    else if(IN_RTR && IN_RTS)
        array[writeptr] <= IN_DATA;
        writeptr = writeptr + 1;
end

// sends data to cmd proc if cmd proc is ready to receive and queue is not empty
always_ff @ (posedge clk) 
begin
    if(reset)
        readptr <= 0;
    else if(OUT_RTR && OUT_RTS)
        OUT_DATA <= array[readptr];
        readptr = readptr + 1;
end


endmodule
