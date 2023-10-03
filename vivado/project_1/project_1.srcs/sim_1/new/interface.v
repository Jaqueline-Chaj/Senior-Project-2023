`timescale 1ns / 1ps
//define state macro or reg?

module host_interface(
    //data input from psoc
    input [7:0] psoc_if_d,
    reg [7:0] psoc_data,
    input psoc_fpga_xfc,
    reg xfc_prev,
    //?
    reg state,
    //?
    input clk,
    input reset,
    output logic fpga_psoc_xfc);
    
always_ff @ (posedge clk)
begin
    if(reset)
        xfc_prev <= 0;
    else if (state == `STATE_S1)
        xfc_prev = psoc_fpga_xfc;
end    
        
always_ff @ (posedge clk)
begin
    if (reset)
        fpga_psoc_xfc <= 0;
    else if (state == `STATE_S1)
        fpga_psoc_xfc <= ~fpga_psoc_xfc;
end

always_ff @ (posedge clk)
begin
    if (reset)
        psoc_data <= 0;
    else if (state == `STATE_S1)
        psoc_data <= psoc_if_d;
end

endmodule
