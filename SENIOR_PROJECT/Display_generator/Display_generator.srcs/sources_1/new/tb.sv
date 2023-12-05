`timescale 1ns / 1ps


module tb();
logic clk,cpu_resetn;

//DIGILENT PORTS


logic hdmi_tx_clk_p;

logic hdmi_tx_clk_n;

logic[2:0] hdmi_tx_p;

logic [2:0] hdmi_tx_n;

Display_Gen_Digilent disp_gen (


.hdmi_tx_clk_p (hdmi_tx_clk_p ),     

 .hdmi_tx_clk_n (hdmi_tx_clk_n ),

.hdmi_tx_p(hdmi_tx_p),

.hdmi_tx_n(hdmi_tx_n),

.cpu_resetn(cpu_resetn),

.clk   (clk )//,

//.SerialClk  (SerialClk  )

);


int i=0;
initial begin
clk=1;
for(i=0; i<2147483647; i=i+1) 
    #5 clk=~clk;
$finish;
end

initial begin
cpu_resetn=0;
#101 cpu_resetn=1;
end
endmodule
