`timescale 1ns / 1ps

module TopLevelInterface(
    input clk,
    input reset_n,
    input psoc_reset_raw,
    input [7:0] host_hostif_d,
    input host_hostif_host_xfc_raw,
    output logic reset,
    output logic host_hostif_fpga_xfc,
    
    output logic [10:0] reg_top_left_x,
    output logic [10:0] reg_top_left_y,
    output logic [10:0] reg_bot_right_x,
    output logic [10:0] reg_bot_right_y,
    output logic [23:0] fill_color,
    output logic [4:0] test_pat_mode,
    //output logic [3:0] engine_trigger,
    output logic  engine_rect_fill_trigger,
    output logic  engine_line_fill_trigger,
    
    //LEDs
    output logic led0,
  //  output logic led1,
    output logic led2,
    output logic led3,
    output logic led4,
    output logic led5,
    output logic led6,
    output logic led7
    );
    
    logic fpga_reset;
    logic fpga_resetp1;
    
    logic psoc_reset;
    logic psoc_reset_rawp1;

    
    always_ff @ (posedge clk)
    begin
        fpga_resetp1 <= ~reset_n;
        fpga_reset <= fpga_resetp1;
        
        psoc_reset_rawp1 <= psoc_reset_raw;
        psoc_reset <= psoc_reset_rawp1;
        
        reset <= (psoc_reset || fpga_reset);
    end
    
    //connections between Host_IF and CMDQueue
    logic [7:0] hostif_queue_DATA;
    logic hostif_queue_RTS;
    logic hostif_queue_RTR;
    
    //connections between CMDQueue and CMDProc
    logic [7:0] queue_proc_DATA;
    logic queue_proc_RTS;
    logic queue_proc_RTR;
    
    logic [3:0] REG_ADDR;
    logic [31:0] REG_DATA;
    logic REG_WE;
    
    // PSOC <---> FPGA Interface
    host_interface HOST_IF( 
    .host_hostif_d(host_hostif_d), //[7:0]
    .host_hostif_host_xfc_raw(host_hostif_host_xfc_raw),
    .hostif_queue_RTR(hostif_queue_RTR),
    .clk(clk),
    .reset(reset),
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
    
    Register RegisterBlock(
    .clk(clk),
    .reset(reset),
    .addr(REG_ADDR),
    .M_dat(REG_DATA),
    .wr_en(REG_WE),
    .reg_lft_x(reg_top_left_x),
    .reg_top_y(reg_top_left_y),
    .reg_bot_right_x(reg_bot_right_x),
    .reg_bot_right_y(reg_bot_right_y),
    .fill_color(fill_color),
    .test_pat_mode(test_pat_mode),
    .engine_rect_fill_trigger(engine_rect_fill_trigger),
    .engine_line_fill_trigger(engine_line_fill_trigger)
    );

/*
logic rect_on_state;
logic line_on_state;

always @(posedge clk) begin
if(reset)
    begin
    rect_on_state <= 0;
    line_on_state <= 0;
    end
    else begin  
        if(engine_rect_fill_trigger )
            begin
            rect_on_state <=1;
            line_on_state <= 0;
            end
        else if(engine_line_fill_trigger)
            begin
            rect_on_state <=0;
            line_on_state <=1;
            end
    end
end
     
//assign led0 = REG_DATA[0];
//assign led1 = REG_DATA[1];
//assign led2 = REG_DATA[2];
//assign led3 = REG_DATA[3];
//assign led4 = rect_on_state;
//assign led5 = line_on_state;

*/
endmodule  

