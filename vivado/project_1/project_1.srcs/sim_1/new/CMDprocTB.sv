`timescale 1ns / 1ps

//predefined ADDR byte just for simplicty right now. Junk data in top half to see if module removes it correctly
`define ADDR_BYTE (8'b1010_0010)

module CMDprocTB(
    );
    
    logic clk;
    logic reset;
    logic reset_n;
    logic OUT_RTS;
    logic OUT_RTR;
    logic [7:0]inData;
    logic [31:0]outData;
    logic REG_WE;
    logic Q_PROC_XFC;
    
    assign reset = ~reset_n;
    assign Q_PROC_XFC = OUT_RTS && OUT_RTR; 
    
    CMDproc CMDp(
        .clk(clk),
        .reset(reset),
        .FIFO_RTS(OUT_RTS),
        .inData(inData),
        .PROC_RTR(OUT_RTR),
        .REG_WE(REG_WE),
        .outData(outData)
        );
        
initial begin
    clk = 0;
    while(1)
        #5 clk = ~clk;
end

initial begin
    reset_n = 0;
    #87 reset_n = 1;
end

//increment inData each time a transfer is complete
always_ff @ (posedge clk)
begin
    if (reset)
        inData <= 0;
    else if (Q_PROC_XFC)
    begin
        inData <= inData + 1;
    end
end

//simulating FIFO Queue always ready to send (has data in queue)
always_ff @ (posedge clk)
begin
    if (reset)
        OUT_RTS <= 0;
    else
        OUT_RTS <= 1;
end






endmodule
