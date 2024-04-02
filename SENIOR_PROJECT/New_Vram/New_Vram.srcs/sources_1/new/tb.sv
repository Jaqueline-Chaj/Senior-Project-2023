`timescale 1ns / 1ps

module tb();
logic clk, cpu_resetn;
logic hdmi_tx_clk_p;
logic hdmi_tx_clk_n;

logic[2:0] hdmi_tx_p;

logic[2:0] hdmi_tx_n;

logic[23:0] foreground_color;
logic[10:0] top, bot;
logic[10:0] lft,rgt;
logic start_trigger;





Display_gen t0(.clk(clk),
.cpu_resetn(cpu_resetn),
.hdmi_tx_clk_p(hdmi_tx_clk_p),
.hdmi_tx_clk_n(hdmi_tx_clk_n),
.hdmi_tx_p(hdmi_tx_p),
.hdmi_tx_n(hdmi_tx_n),
.top(top),
.lft(lft),
.bot(bot),
.rgt(rgt),
.foreground_color(foreground_color),
.start_trigger(start_trigger)
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
#721 cpu_resetn=1;
end
initial begin
start_trigger=0;
#10000
start_trigger=1;
#10 start_trigger=0;
end

initial begin
    foreground_color=24'hFFFF00;
    top=11'b00_0010_0000;
    bot=11'b00_1111_1111;
    lft=11'b000_0010_0000;
    rgt=11'b000_1111_1111;
end

endmodule




