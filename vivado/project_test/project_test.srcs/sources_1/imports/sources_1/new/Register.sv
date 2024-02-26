`timescale 1ns / 1ps

module Register(
    input logic clk,
    input logic reset,
    
    input logic[3:0] addr, 
    input logic[31:0] M_dat,
    input logic wr_en,
    
    output logic[10:0] reg_lft_x,
    output logic[10:0] reg_top_y,
    output logic[10:0] reg_bot_right_x,
    output logic[10:0] reg_bot_right_y,
    output logic[23:0] fill_color,
    output logic[4:0] test_pat_mode,
    output logic[3:0] engine_trigger
    );

logic [31:0] reg_0;
logic [31:0] reg_1;
logic [31:0] reg_2;
logic [31:0] reg_3;
logic [31:0] reg_4;

//Write into the regsters

always_ff @(posedge clk) begin
    if(reset) begin 
        reg_0 <= 0;
        reg_1 <= 0;
        reg_2 <= 0;
        reg_3 <= 0;
        reg_4 <= 0;
    end
    else begin
        if (wr_en) begin
            case (addr)
                0: reg_0 <= M_dat;
                1: reg_1 <= M_dat;
                2: reg_2 <= M_dat;
                3: reg_3 <= M_dat;
                4: reg_4 <= M_dat;
             endcase
        end
    end
end

//Assign specific ranges from certain registers as output values
assign reg_lft_x        = reg_0[10:0];
assign reg_top_y        = reg_0[21:11];
assign reg_bot_right_x  = reg_1[10:0];
assign reg_bot_right_y  = reg_1[21:11];
assign fill_color       = reg_2[23:0];
assign test_pat_mode    = reg_3[5:0];
assign engine_trigger   = reg_4[3:0];


endmodule