`timescale 1ns / 1ps

module TopLevelInterface(
    input clk,
    input reset_n,
    input [7:0] psoc_if_d,
    input psoc_fpga_xfc,
    output logic fpga_psoc_xfc,
    output logic REG_WE,
    output [31:0] REG_WR_DATA
    );
    
    logic reset;
    assign reset = ~reset_n;
    
    //connections between Host_IF and CMDQueue
    logic [7:0] psoc_data;
    logic IF_RTS;
    logic QUEUE_RTR;
    
    //connections between CMDQueue and CMDProc
    logic [7:0] CMD_Q_OUT_DATA;
    logic QUEUE_RTS;
    logic PROC_RTR;
    
    // PSOC <---> FPGA Interface
    host_interface HOST_IF( 
    .psoc_if_d(psoc_if_d), //[7:0]
    .psoc_fpga_xfc(psoc_fpga_xfc),
    .QUEUE_RTR(QUEUE_RTR),
    .clk(clk),
    .reset_n(reset_n),
    .fpga_psoc_xfc(fpga_psoc_xfc),
    .psoc_data(psoc_data),  //[7:0]
    .IF_RTS(IF_RTS)
    );
    
    // FPGA Interface <---> Command Queue <---> Command Processor
    command_queue #(.DEPTH(16), .WIDTH(8)) CMDQ(
    .clk(clk),
    .reset(reset),
    //Input side
    .IN_RTS(IF_RTS),
    .IN_DATA(psoc_data),
    .IN_RTR(QUEUE_RTR),
    //Output side
    .OUT_RTS(QUEUE_RTS),
    .OUT_DATA(CMD_Q_OUT_DATA),
    .OUT_RTR(PROC_RTR)
    );
    
    // Command Queue <---> Command Processor <---> Registers
    CMDproc CMDP(
    .clk(clk),
    .reset(reset),
    .OUT_RTS(QUEUE_RTS),
    .inData(CMD_Q_OUT_DATA),
    .OUT_RTR(PROC_RTR),
    .REG_WE(REG_WE),
    .outData(REG_WR_DATA)
    );

endmodule  
