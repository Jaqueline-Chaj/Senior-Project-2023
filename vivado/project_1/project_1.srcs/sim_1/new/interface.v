`timescale 1ns / 1ps
//define state macros
`define STATE_S0 (1'b0)
`define STATE_S1 (1'b1)

module host_interface(
    input [7:0] psoc_if_d, 
    input psoc_fpga_xfc,
    input clk,
    input reset_n,
    output logic fpga_psoc_xfc,
    );

logic psoc_fpga_xfc_prev;
logic state;
logic [7:0] psoc_data;
logic reset1;
logic reset2;
logic reset;

//gets the incoming handshake signal from PSOC
always_ff @ (posedge clk)
begin
    if(reset)
        psoc_fpga_xfc_prev <= 0;
    else if (state == `STATE_S1)
        psoc_fpga_xfc_prev <= psoc_fpga_xfc;
end    

//toggles on/off the outgoing handshake signal to PSOC
always_ff @ (posedge clk)
begin
    if (reset)
        fpga_psoc_xfc <= 0;
    else if (state == `STATE_S1)
        fpga_psoc_xfc <= ~fpga_psoc_xfc;
end

//stores incoming byte to psoc_data
always_ff @ (posedge clk)
begin
    if (reset)
        psoc_data <= 0;
    else if (state == `STATE_S1)
        psoc_data <= psoc_if_d;
        
end

//State transition logic
always_ff @ (posedge clk)
begin
    if (reset)
        state <=`STATE_S0;
    else if (state == `STATE_S1)
        state <= `STATE_S0;
    else if (psoc_fpga_xfc != psoc_fpga_xfc_prev)
        state <= `STATE_S1;  
end

//reset flip flop
always_ff @ (posedge clk)
begin
    reset1 <= ~reset_n;
    reset2 <= reset1;
    reset <= reset2;
end


endmodule
