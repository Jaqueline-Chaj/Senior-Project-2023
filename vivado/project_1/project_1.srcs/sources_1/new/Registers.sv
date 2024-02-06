`timescale 1ns / 1ps

`define numregs (5)
`define reg_write_id     (4'b0000)
`define rect_fill_eng_id (4'b0001)
`define test_pat_eng_id  (4'b0010)  


module Register(
    input  logic clk,
    input  logic reset,
    
    input logic[3:0] engine_id,
    input logic[3:0] addr, 
    input logic[31:0] M_dat,
    input logic wr_en,
    
    output logic[10:0] reg_top_left_x,
    output logic[10:0] reg_top_left_y,
    output logic[10:0] reg_bot_right_x,
    output logic[10:0] reg_bot_right_y,
    output logic[23:0] fill_color,
    output logic[4:0] test_pat_mode,
    output logic trig_rect_fill_eng 
    );

logic[31:0] reg_arr[`numregs-1:0];
//reg 0: top_left_pos
//reg 1: bot_right_pos
//reg 2: fill_color
//reg 3: test_pat_mode
//reg 4: engine_trigger_reg

//Write into the regsters
integer i;
always_ff@(posedge clk) begin
    if(reset) begin 
    //set all registers to 0
        for (i=0; i < `numregs; ++i) 
            reg_arr[i] <= 0;
    end
    else begin
        if (wr_en) begin
        //read in 32-bit words to specified register
            reg_arr[addr] <= M_dat;
        end
    end
end

assign trig_rect_fill_eng = wr_en && (addr == 4'b0100) && (reg_arr[4][3:0] == `rect_fill_eng_id);

//Read from the registers into Dispaly_generator
assign reg_top_left_x   = reg_arr[0][10:0];
assign reg_top_left_y   = reg_arr[0][21:11];
assign reg_bot_right_x  = reg_arr[1][10:0];
assign reg_bot_right_y  = reg_arr[1][21:11];
assign fill_color       = reg_arr[2][23:0];
assign test_pat_mode    = reg_arr[3][5:0];


endmodule