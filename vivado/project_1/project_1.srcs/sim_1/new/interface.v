`timescale 1ns / 1ps
//define state macros
`define STATE_S0 (1'b0)
`define STATE_S1 (1'b1)

module host_interface(
    input [7:0] host_hostif_d, 
    input host_hostif_host_xfc,
    input hostif_queue_RTR,
    input clk,
    input reset_n,
    output logic host_hostif_fpga_xfc,
    output logic [7:0] hostif_queue_DATA,
    output logic hostif_queue_RTS
    );

logic host_hostif_host_xfc_prev;
logic state;
logic reset1;
logic reset2;
logic reset;
logic QUEUE_XFC = hostif_queue_RTS && hostif_queue_RTR;

//gets the incoming handshake signal from PSOC
always_ff @ (posedge clk)
begin
    if(reset)
        host_hostif_host_xfc_prev <= 0;
    else if (state == `STATE_S1)
        host_hostif_host_xfc_prev <= host_hostif_host_xfc;
end    

//toggles on/off the outgoing handshake signal to PSOC
always_ff @ (posedge clk)
begin
    if (reset)
        host_hostif_fpga_xfc <= 0;
    else if (state == `STATE_S1)
        host_hostif_fpga_xfc <= ~host_hostif_fpga_xfc;
end

//sets IF_RTS high if data is valid
always_ff @ (posedge clk)
begin
    if (reset)
        hostif_queue_RTS <= 0;
    else if (state == `STATE_S0)
        hostif_queue_RTS <= 0;
    else if (state == `STATE_S1)
        hostif_queue_RTS <= 1;
end

//updates hostif_queue_DATA with new incoming data byte
always_ff @ (posedge clk)
begin
    if (reset)
        hostif_queue_DATA <= 0;
    else if (state == `STATE_S1)
        hostif_queue_DATA <= host_hostif_d;
        
end

//State transition logic
always_ff @ (posedge clk)
begin
    if (reset)
        state <= `STATE_S0;
    else if (state == `STATE_S1)
        state <= `STATE_S0;
    else if (host_hostif_host_xfc != host_hostif_host_xfc_prev)
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
