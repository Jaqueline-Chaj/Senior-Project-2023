`timescale 1ns / 1ps

module TopLevelInterface(
    input clk,
    input reset_n,
    input [7:0] host_hostif_d,
    input host_hostif_host_xfc,
    output logic host_hostif_fpga_xfc,
    output logic REG_WE,
    output [31:0] REG_DATA,
    output [3:0] REG_ADDR
    );
    
    logic reset;
    assign reset = ~reset_n;
    
    //connections between Host_IF and CMDQueue
    logic [7:0] hostif_queue_DATA;
    logic hostif_queue_RTS;
    logic hostif_queue_RTR;
    
    //connections between CMDQueue and CMDProc
    logic [7:0] queue_proc_DATA;
    logic queue_proc_RTS;
    logic queue_proc_RTR;
    
    // PSOC <---> FPGA Interface
    host_interface HOST_IF( 
    .host_hostif_d(host_hostif_d), //[7:0]
    .host_hostif_host_xfc(host_hostif_host_xfc),
    .hostif_queue_RTR(hostif_queue_RTR),
    .clk(clk),
    .reset_n(reset_n),
    .host_hostif_fpga_xfc(host_hostif_fpga_xfc),
    .hostif_queue_DATA(hostif_queue_DATA),  //[7:0]
    .hostif_queue_RTS(hostif_queue_RTS)
    );
    
    // FPGA Interface <---> Command Queue <---> Command Processor
    command_queue #(.DEPTH(16), .WIDTH(8)) CMDQ(
    .clk(clk),
    .reset(reset),
    //Input side
    .IN_RTS(hostif_queue_RTS),
    .IN_DATA(hostif_queue_DATA),
    .IN_RTR(hostif_queue_RTR),
    //Output side
    .OUT_RTS(queue_proc_RTS),
    .OUT_DATA(queue_proc_DATA),
    .OUT_RTR(queue_proc_RTR)
    );
    
    // Command Queue <---> Command Processor <---> Registers
    CMDproc CMDP(
    .clk(clk),
    .reset(reset),
    .HOST_RTS(queue_proc_RTS),
    .HOST_DATA(queue_proc_DATA),
    .HOST_RTR(queue_proc_RTR),
    .REG_WE(REG_WE),
    .REG_DATA(REG_DATA),
    .REG_ADDR(REG_ADDR)
    );

endmodule  
