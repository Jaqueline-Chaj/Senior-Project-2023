`timescale 1ns / 1ps

module tb();
logic clk, cpu_resetn;
logic hdmi_tx_clk_p;
logic hdmi_tx_clk_n;

logic[2:0] hdmi_tx_p;

logic[2:0] hdmi_tx_n;





top t0(.clk(clk),
.cpu_resetn(cpu_resetn),
.hdmi_tx_clk_p(hdmi_tx_clk_p),
.hdmi_tx_clk_n(hdmi_tx_clk_n),
.hdmi_tx_p(hdmi_tx_p),
.hdmi_tx_n(hdmi_tx_n)
);


int i=0;
initial begin
clk=1;
for(i=0; i<100000000; i=i+1) 
    #5 clk=~clk;
$finish;
end

initial begin
cpu_resetn=0;
#57 cpu_resetn=1;
end
endmodule


