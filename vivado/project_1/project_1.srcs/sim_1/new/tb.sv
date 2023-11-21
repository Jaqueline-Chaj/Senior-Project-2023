`timescale 1ns / 1ps

module tb(
    );

    logic [7:0] psoc_if_d; 
    logic psoc_fpga_xfc;
    logic psoc_fpga_xfc_prev;
    logic psoc_fpga_xfc_toggle;
    logic clk;
    logic reset;
    logic reset_d1;
    logic reset_n;
    logic fpga_psoc_xfc;
    logic fpga_psoc_xfc_prev;
    logic fpga_psoc_xfc_toggle;
    logic fpga_psoc_xfc_toggle_d1;
    
   
    assign psoc_fpga_xfc_toggle = psoc_fpga_xfc != psoc_fpga_xfc_prev;
    assign fpga_psoc_xfc_toggle = fpga_psoc_xfc != fpga_psoc_xfc_prev;
    assign reset = ~reset_n;
    
    host_interface IF(
    .psoc_if_d(psoc_if_d),
    .psoc_fpga_xfc(psoc_fpga_xfc),
    .clk(clk),
    .reset_n(reset_n),
    .fpga_psoc_xfc(fpga_psoc_xfc)
    );
    
    
initial begin
    clk = 0;
    while (1)
        #5 clk = ~clk;
end
    
    
initial begin
        reset_n = 0;
        #87 reset_n = 1;
end
    
    
always_ff @ (posedge clk)
begin
    if (reset)
        psoc_if_d <= 0;
    else if (fpga_psoc_xfc_toggle)
        psoc_if_d += 1;
end
    
    
always_ff @ (posedge clk)
begin
    if (reset)
    begin
        psoc_fpga_xfc_prev <= 0;
        fpga_psoc_xfc_prev <= 0;
    end
    else
    begin
        psoc_fpga_xfc_prev <= psoc_fpga_xfc;
        fpga_psoc_xfc_prev <= fpga_psoc_xfc;    
    end
end


always_ff @ (posedge clk)
begin
    if (reset)
        psoc_fpga_xfc <= 0;
    else if (fpga_psoc_xfc_toggle_d1 || reset_d1)
        psoc_fpga_xfc <= ~psoc_fpga_xfc;
end   


always_ff @ (posedge clk)
begin
    reset_d1 <= reset;
    if (reset)
        fpga_psoc_xfc_toggle_d1 <=0;
    else 
        fpga_psoc_xfc_toggle_d1 <= fpga_psoc_xfc_toggle;
end


    
endmodule
