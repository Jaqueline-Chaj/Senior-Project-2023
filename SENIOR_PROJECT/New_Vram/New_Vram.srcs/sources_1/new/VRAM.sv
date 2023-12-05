module VRAM(
input logic clk,
input logic[19:0] RD_addr,
input wr_en,
input logic[19:0] waddr,
input logic[7:0] wr_data,
output[7:0] RD_Data
);




blk_mem_gen_0 blk_mem(
.clka(clk),
.addra(waddr),
.dina(wr_data),
.wea(wr_en),
.clkb(clk),
.addrb(RD_addr),
.doutb(RD_Data)
);






endmodule