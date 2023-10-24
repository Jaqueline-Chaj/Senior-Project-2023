`timescale 1ns / 1ps

module queueTB(
    );

    logic clk;
    logic reset_n;
    logic testD[7:0];
    
    

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


    
endmodule
