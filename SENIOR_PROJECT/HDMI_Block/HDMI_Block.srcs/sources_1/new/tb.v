`timescale 1ns / 1ps


module tb();
logic clk, reset_n, link_clk;

 logic  DDC_OUT_scl_i,
  DDC_OUT_scl_o,
  DDC_OUT_scl_t,
  DDC_OUT_sda_i,
  DDC_OUT_sda_o,
  DDC_OUT_sda_t,
  
  LINK_DATA0_OUT_tvalid,

  LINK_DATA1_OUT_tvalid,

  LINK_DATA2_OUT_tvalid;
  logic [19:0]LINK_DATA0_OUT_tdata,  
  LINK_DATA2_OUT_tdata,
  LINK_DATA1_OUT_tdata;
  

assign DDC_OUT_sda_i=1;
assign DDC_OUT_scl_i=1;

Display_gen disp(.clk(clk),
.link_clk(link_clk),
.resetn(reset_n),
  .DDC_OUT_scl_i(  DDC_OUT_scl_i),
.DDC_OUT_scl_o(DDC_OUT_scl_o),
  .DDC_OUT_scl_t(DDC_OUT_scl_t),
  .DDC_OUT_sda_i(DDC_OUT_sda_i),
  .DDC_OUT_sda_o(DDC_OUT_sda_o),
  .DDC_OUT_sda_t(DDC_OUT_sda_t),
  .LINK_DATA0_OUT_tdata(LINK_DATA0_OUT_tdata),
  .LINK_DATA0_OUT_tvalid(LINK_DATA0_OUT_tvalid),
  .LINK_DATA1_OUT_tdata(LINK_DATA1_OUT_tdata),
  .LINK_DATA1_OUT_tvalid(LINK_DATA1_OUT_tvalid),
 .LINK_DATA2_OUT_tdata(LINK_DATA2_OUT_tdata),
 .LINK_DATA2_OUT_tvalid(LINK_DATA2_OUT_tvalid)
 );

int i=0;
initial begin
clk=1;
for(i=0; i<5000000000; i=i+1) 
    #6.73 clk=~clk;
$finish;
end


initial begin
reset_n=0;
#100 reset_n=1;
end

int j=0;
initial begin
link_clk=1;
for(j=0; j<5000000000; j=j+1) 
    #13.46 link_clk=~link_clk;
$finish;
end
endmodule
