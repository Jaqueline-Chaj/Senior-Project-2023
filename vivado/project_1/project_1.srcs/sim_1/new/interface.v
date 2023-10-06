`timescale 1ns / 1ps
//define state macros
`define STATE_S0 (1'b0)
`define STATE_S1 (1'b1)

module host_interface(
    //data input from psoc
    input [7:0] psoc_if_d,
    input psoc_fpga_xfc,
    input clk,
    input reset,
    output logic fpga_psoc_xfc,
    reg xfc_prev,
    reg [7:0] psoc_data
    );

reg state;
reg next_state;

//gets the incoming handshake signal from PSOC
always_ff @ (posedge clk)
begin
    if(reset)
        xfc_prev <= 0;
    else if (state == `STATE_S1)
        xfc_prev <= psoc_fpga_xfc;
end    

//toggles on/off the outgoing handshake signal to PSOC
always_ff @ (posedge clk)
begin
    if (reset)
        fpga_psoc_xfc <= 0;
    else if (state == `STATE_S1)
        fpga_psoc_xfc <= ~fpga_psoc_xfc;
end

//stores incoming byte to register
always_ff @ (posedge clk)
begin
    if (reset)
        psoc_data <= 0;
    else if (state == `STATE_S1)
        psoc_data <= psoc_if_d;
        state <= `STATE_S0;
end

endmodule
