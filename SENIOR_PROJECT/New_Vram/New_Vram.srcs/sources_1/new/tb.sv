`timescale 1ns / 1ps

module tb();
logic clk, reset;
logic[23:0] rbgtodvi;


top t0(.clk(clk),
.reset(reset),
.rbgtodvi(rbgtodvi));


int i=0;
initial begin
clk=1;
for(i=0; i<100000000; i=i+1) 
    #5 clk=~clk;
$finish;
end

initial begin
reset=1;
#57 reset=0;
end
endmodule


