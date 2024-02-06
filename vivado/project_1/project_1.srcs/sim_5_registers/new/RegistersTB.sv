`timescale 1ns / 1ps

module RegistersTB(
    );
    //inputs
    logic [3:0] engine_id;
    logic [3:0] addr;
    logic [31:0] M_dat;
    logic wr_en;
    
    //outputs
    logic[10:0] reg_top_left_x;
    logic[10:0] reg_top_left_y;
    logic[10:0] reg_bot_right_x;
    logic[10:0] reg_bot_right_y;
    logic[23:0] fill_color;
    logic[4:0] test_pat_mode;
    logic trig_rect_fill_eng;
    
    Register RegisterBlock(
    .clk(clk),
    .reset(reset),
    .engine_id(engine_id),
    .addr(addr),
    .M_dat(M_dat),
    .wr_en(wr_en),
    .reg_top_left_x(reg_top_left_x),
    .reg_top_left_y(reg_top_left_y),
    .reg_bot_right_x(reg_bot_right_x),
    .reg_bot_right_y(reg_bot_right_x),
    .fill_color(fill_color),
    .test_pat_mode(test_pat_mode),
    .trig_rect_fill_eng(trig_rect_fill_eng)
    );
    
logic clk;
logic reset_n;
assign reset_n = ~reset;


initial begin
    clk = 0;
    while(1)
        #5 clk = ~clk;
end

initial begin
    reset_n = 0;
    #87 reset_n = 1;
end

always_ff @ (posedge clk)
begin
    if(reset)
        engine_id <= 0;
    else if (addr == 4)
        engine_id <= 1; //trigger value for rectangle engine
end

always_ff @ (posedge clk)
begin
    if(reset)
        addr <= 0;
    else if (addr == 4)
        addr <= 0;
    else
        addr <= addr + 1;
end

always_ff @ (posedge clk)
begin
    if(reset)
        M_dat <= 0;
    else
        M_dat <= M_dat + 2;
end

endmodule
