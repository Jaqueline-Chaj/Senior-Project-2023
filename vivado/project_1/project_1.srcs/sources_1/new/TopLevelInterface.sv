`timescale 1ns / 1ps



module TopLevelInterface(
    input clk,
    input reset_n,
    input [7:0] psoc_if_d,
    input psoc_fpga_xfc,
    input fpga_psoc_xfc,
    output REG_WE,
    output [31:0] REG_WR_DATA
    );
    
    logic reset;
    assign reset = ~reset_n;
    
    //connections between Host_IF and CMDQueue
    logic [7:0] psoc_data;
    logic IF_RTS;
    logic _RTR;
    
    //connections between CMDQueue and CMDProc
    
    
    // PSOC <---> FPGA Interface
    host_interface HOST_IF( 
    .psoc_if_d(psoc_if_d),
    .psoc_fpga_xfc(psoc_fpga_xfc),
    .QUEUE_RTR(QUEUE_RTR),
    .clk(clk),
    .reset_n(reset_n),
    .fpga_psoc_xfc(fpga_psoc_xfc),
    .psoc_data(psoc_data),
    .IF_RTS(IF_RTS)
    );
    
    // FPGA Interface <---> Command Queue <---> Command Processor
    command_queue #(.DEPTH(16), .WIDTH(8)) CMDQ(
    .clk(clk),
    .reset(reset),
    //Input side
    .IN_RTS(IF_RTS),
    .IN_DATA(IN_DATA),
    .IN_RTR(QUEUE_RTR),
    //Output side
    .OUT_RTS(OUT_RTS),
    .OUT_DATA(OUT_DATA),
    .OUT_RTR(OUT_RTR)
    );
    
    // Command Queue <---> Command Processor <---> Registers
    CMDproc CMDP(
    .clk(clk),
    .reset(reset),
    .OUT_RTS(OUT_RTS),
    .inData(inData),
    .OUT_RTR(OUT_RTR),
    .REG_WE(REG_WE),
    .outData(REG_WR_DATA)
    );
    
    
endmodule
