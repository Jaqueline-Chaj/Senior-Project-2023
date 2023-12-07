`timescale 1ns / 1ps

module tb();
logic clk, cpu_resetn;
logic hdmi_tx_clk_p;
logic hdmi_tx_clk_n;

logic[2:0] hdmi_tx_p;

logic[2:0] hdmi_tx_n;
logic sw_0,
sw_1,
sw_2,
sw_3,
sw_4,
sw_5,
sw_6,
sw_7;





 initial begin
   sw_0=1;
   sw_1=1;
   sw_2=1;
   sw_3=1;
   sw_4=1;
   sw_5=1;
   sw_6=1;
   sw_7=1;
     
 
   
   #47  sw_0=~sw_0;
    sw_1=~sw_1;
    sw_2=~sw_2;
    sw_3=~sw_3;
    sw_4=~sw_4;
    sw_5=~sw_5;
    sw_6=~sw_6;
    sw_7=~sw_7;

   
   $finish;
    end


top t0(.clk(clk),
.cpu_resetn(cpu_resetn),
.hdmi_tx_clk_p(hdmi_tx_clk_p),
.hdmi_tx_clk_n(hdmi_tx_clk_n),
.hdmi_tx_p(hdmi_tx_p),
.hdmi_tx_n(hdmi_tx_n),
.sw_0(sw_0),//,
.sw_1(sw_1),
.sw2(sw_2),
.sw3(sw_3),
.sw4(sw_4),
.sw5(sw_5),
.sw6(sw_6),
.sw7(sw_7)
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


