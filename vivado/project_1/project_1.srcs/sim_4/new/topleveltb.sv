`timescale 1ns / 1ps

`define STATE_B0 (3'b000) //engine_id and addr
`define STATE_B1 (3'b001) //byte 1
`define STATE_B2 (3'b010) //byte 2
`define STATE_B3 (3'b011) //byte 3
`define STATE_B4 (3'b100) //byte 4

module topleveltb(
    );
    
    logic clk;
    logic reset;
    logic reset_n;
    logic reset_d1;
    logic [7:0] host_hostif_d;  //was psoc_if_d
    
//    logic [2:0] state;
//    logic [7:0] addr_val;
//    logic [7:0] data_val;
    
    logic host_hostif_host_xfc; //was psoc_fgpa_xfc
    logic host_hostif_host_xfc_prev;
    logic host_hostif_host_xfc_toggle;
    
    logic host_hostif_fpga_xfc; //was fpga_psoc_xfc
    logic host_hostif_fpga_xfc_prev;
    logic host_hostif_fpga_xfc_toggle;
    logic host_hostif_fpga_xfc_toggle_d1;    
    
    assign host_hostif_host_xfc_toggle = host_hostif_host_xfc != host_hostif_host_xfc_prev;
    assign host_hostif_fpga_xfc_toggle = host_hostif_fpga_xfc != host_hostif_fpga_xfc_prev;   
    
    logic REG_WE;
    logic [31:0] REG_WR_DATA;
    logic [3:0] REG_ADDR;
    
    logic [10:0] reg_top_left_x;
    logic [10:0] reg_top_left_y;
    logic [10:0] reg_bot_right_x;
    logic [10:0] reg_bot_right_y;
    logic [23:0] fill_color;
    logic [4:0]  test_pat_mode;    
    logic trig_rect_fill_eng;
    
    assign reset = ~reset_n;
    
    TopLevelInterface TLIF(
        .clk(clk),
        .reset_n(reset_n),
        .host_hostif_d(host_hostif_d),
        .host_hostif_host_xfc_raw(host_hostif_host_xfc),
        .host_hostif_fpga_xfc(host_hostif_fpga_xfc),
        .reg_top_left_x(reg_top_left_x),
        .reg_top_left_y(reg_top_left_y),
        .reg_bot_right_x(reg_bot_right_x),
        .reg_bot_right_y(reg_bot_right_y),
        .fill_color(fill_color),
        .test_pat_mode(test_pat_mode),
        .trig_rect_fill_eng(trig_rect_fill_eng)
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

//byte sent by host
always_ff @ (posedge clk)
begin
    if (reset)
        host_hostif_d <= 0;
    else 
        host_hostif_d <= host_hostif_d + 4'b0001;
//    else if (state == `STATE_B0)
//        host_hostif_d <= addr_val;
//    else
//        host_hostif_d <= data_val;
end
    
//tracking previous xfc's
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

//toggle host xfc if fpga toggle detected
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

////state transition logic for data being sent 
//always_ff @ (posedge clk)
//begin
//    if (reset)
//        state <= 0;
//    else
//    begin
//        if(state == `STATE_B0) //address was sent
//            state <= `STATE_B1;
//        else if(state == `STATE_B1)
//            state <= `STATE_B2;
//        else if(state == `STATE_B2)
//            state <= `STATE_B3;
//        else if(state == `STATE_B3)
//            state <= `STATE_B4;
//        else if(state == `STATE_B4) //last byte of packet sent, go back to waiting for address
//            state <= `STATE_B0;        
//    end
//end

//always_ff @ (posedge clk)
//begin
//    if (reset)
//    begin
//        addr_val <= 0;
//        data_val <= 0;
//    end
//    else if (state == `STATE_B0)
//        addr_val <= addr_val + 1;
//    else
//        data_val <= data_val + 2;
//end


endmodule
