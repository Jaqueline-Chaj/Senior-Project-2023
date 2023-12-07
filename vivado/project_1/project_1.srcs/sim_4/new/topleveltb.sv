`timescale 1ns / 1ps

module topleveltb(
    );
    
    logic clk;
    logic reset;
    logic reset_n;
    logic reset_d1;
    logic [7:0] host_hostif_d;  //was psoc_if_d
    
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
    
    
    assign reset = ~reset_n;
    
    TopLevelInterface TLIF(
        .clk(clk),
        .reset_n(reset_n),
        .host_hostif_d(host_hostif_d),
        .host_hostif_host_xfc_raw(host_hostif_host_xfc),
        .host_hostif_fpga_xfc(host_hostif_fpga_xfc),
        .REG_WE(REG_WE),
        .REG_DATA(REG_DATA),
        .REG_ADDR(REG_ADDR)
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

endmodule
