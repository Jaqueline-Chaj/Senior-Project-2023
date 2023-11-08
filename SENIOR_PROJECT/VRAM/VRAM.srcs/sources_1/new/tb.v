`timescale 1ns / 1ps

module tb();
logic clk, reset;
logic[7:0] RD_data;


top t0(.clk(clk),
.reset(reset),
.RD_data(RD_data) );


int i=0;
initial begin
clk=1;
for(i=0; i<21474836; i=i+1) 
    #5 clk=~clk;
$finish;
end

initial begin
reset=1;
#101 reset=0;
end
endmodule


