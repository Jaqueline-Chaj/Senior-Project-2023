`timescale 1ns / 1ps

//`define STATE_B0 (3'b000)   
//`define STATE_B1 (3'b001)     
//`define STATE_B2 (3'b010)   
//`define STATE_B3 (3'b011)   
//`define STATE_B4 (3'b100)   


module topleveltb(
    );
    
    logic clk;
    logic reset;
    logic reset_n;
    logic reset_d1;
    logic psoc_reset_raw;
    logic [7:0] host_hostif_d;  //was psoc_if_d
    
    logic host_hostif_host_xfc; //was psoc_fgpa_xfc
    logic host_hostif_host_xfc_prev;
    logic host_hostif_host_xfc_toggle;
    
//    logic [2:0] state;
//    logic [7:0] addr_val;
//    logic [7:0] data_val;
    
    logic host_hostif_fpga_xfc; //was fpga_psoc_xfc
    logic host_hostif_fpga_xfc_prev;
    logic host_hostif_fpga_xfc_toggle;
    logic host_hostif_fpga_xfc_toggle_d1;    
    
    assign host_hostif_host_xfc_toggle = host_hostif_host_xfc != host_hostif_host_xfc_prev;
    assign host_hostif_fpga_xfc_toggle = host_hostif_fpga_xfc != host_hostif_fpga_xfc_prev;   
    assign psoc_reset_raw = 0;
    
    logic[10:0] reg_top_left_x;
    logic[10:0] reg_top_left_y;
    logic[10:0] reg_bot_right_x;
    logic[10:0] reg_bot_right_y;
    logic[23:0] fill_color;
    logic[4:0] test_pat_mode;
    logic[3:0] engine_trigger;
    
    assign reset = ~reset_n;
    
    TopLevelInterface TLIF(
        .clk(clk),
        .reset_n(reset_n),
        .psoc_reset_raw(psoc_reset_raw),
        .host_hostif_d(host_hostif_d),
        .host_hostif_host_xfc_raw(host_hostif_host_xfc),
        .host_hostif_fpga_xfc(host_hostif_fpga_xfc),
        .reg_top_left_x(reg_top_left_x),
        .reg_top_left_y(reg_top_left_y),
        .reg_bot_right_x(reg_bot_right_x),
        .reg_bot_right_y(reg_bot_right_y),
        .fill_color(fill_color),
        .test_pat_mode(test_pat_mode),
        .engine_trigger(engine_trigger)
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

initial begin
    psoc_reset_raw = 1;
    #100 psoc_reset_raw = 0;
end


always_ff @ (posedge clk)
begin
    if (reset)
        host_hostif_d <= 0;
    else if (host_hostif_fpga_xfc_toggle)
        host_hostif_d <= host_hostif_d + 4'b0010;
end
    
    
always_ff @ (posedge clk)
begin
    if (reset)
    begin
        host_hostif_host_xfc_prev <= 0;
        host_hostif_fpga_xfc_prev <= 0;
    end
    else
    begin
        host_hostif_host_xfc_prev <= host_hostif_host_xfc;
        host_hostif_fpga_xfc_prev <= host_hostif_fpga_xfc;    
    end
end


always_ff @ (posedge clk)
begin
    if (reset)
        host_hostif_host_xfc <= 0;
    else if (host_hostif_fpga_xfc_toggle_d1 || reset_d1)
        host_hostif_host_xfc <= ~host_hostif_host_xfc;
end   


always_ff @ (posedge clk)
begin
    reset_d1 <= reset;
    if (reset)
        host_hostif_fpga_xfc_toggle_d1 <=0;
    else 
        host_hostif_fpga_xfc_toggle_d1 <= host_hostif_fpga_xfc_toggle;
end

////byte value state transtition addr_val
//always_ff @ (posedge clk)
//begin
//    if (reset)
//        state <= 0;
//    else if (host_hostif_fpga_xfc_toggle)
//        if (state == `STATE_B0)
//            state <= `STATE_B1;
//        else if (state == `STATE_B1)
//            state <= `STATE_B2;
//        else if (state == `STATE_B2)
//            state <= `STATE_B3;        
//        else if (state == `STATE_B3)
//            state <= `STATE_B4;        
//        else if (state == `STATE_B4)
//            state <= `STATE_B0;        
//end

////addr and data value incrementing logic
//always_ff @ (posedge clk)
//begin
//    if (reset)
//    begin
//        addr_val <= 0;
//        data_val <= 0;
//    end
//    else if (host_hostif_host_xfc_toggle)
//    begin
//        if (state == `STATE_B0)
//            addr_val <= addr_val + 1;
//        else 
//            data_val <= data_val + 2;
//    end
//end

endmodule
