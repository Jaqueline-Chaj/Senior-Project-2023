`timescale 1ns / 1ps

module queueTB(
    );

    logic clk;
    logic reset;
    logic IN_RTS;
    logic [7:0] IN_DATA;
    logic IN_RTR;
    logic OUT_RTS;
    logic [7:0] OUT_DATA;
    logic OUT_RTR;

    command_queue #(.DEPTH(16), .WIDTH(8)) cmdQ(
    .clk(clk),
    .reset(reset),
    //Input interface
    .IN_RTS(IN_RTS),
    .IN_DATA(IN_DATA),
    .IN_RTR(IN_RTR),
    //Output interface
    .OUT_RTS(OUT_RTS),
    .OUT_DATA(OUT_DATA),
    .OUT_RTR(OUT_RTR)
    );
    
    
initial begin
    clk = 0;
    while(1)
        #5 clk = ~clk;
end

initial begin
    reset = 0;
    #87 reset = 1;
end

//increments IN_DATA to simulate new bytes coming in
always_ff @ (posedge clk)
begin
    if(reset)
        IN_DATA <= 0;
    else if (IN_RTR && IN_RTS)
        IN_DATA <= IN_DATA + 1;
end



endmodule
