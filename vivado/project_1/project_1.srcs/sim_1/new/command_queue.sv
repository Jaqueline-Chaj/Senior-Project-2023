`timescale 1ns / 1ps


module command_queue #(parameter DEPTH=16, WIDTH=8) (

        input clk,
        input reset,
    //Input interface 
        input logic In_RTS,  // when 1, IN_DATA is valid
        input logic [WIDTH-1:0] IN_DATA,
        output logic IN_RTR,
    //Output interface 
        output logic OUT_RTS,   // when 1, OUT_DATA is valid
        output logic [WIDTH-1:0] OUT_DATA,
        input logic OUT_RTR
    );

logic [WIDTH-1:0] array [DEPTH-1:0];
logic writeptr[$clog2(DEPTH):0];
logic readptr[$clog2(DEPTH):0];



always_ff @ (posedge clk)
begin
    

end


    
    
endmodule
