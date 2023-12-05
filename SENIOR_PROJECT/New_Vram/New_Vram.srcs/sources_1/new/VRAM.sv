module VRAM(
input logic clk,
input logic[19:0] RD_addr,
//input wr_en,
//input logic[19:0] Wr_addr,
//input logic[7:0] wr_data
output[7:0] RD_Data
);
logic[7:0] dina;
logic[19:0] addra;
logic wea;

assign wea=0;
assign addra=0;
assign dina=0;
blk_mem_gen_0 blk_mem(
.clka(clk),
.addra(addra),
.dina(dina),
.wea(wea),
.clkb(clk),
.addrb(RD_addr),
.doutb(RD_Data)
);






endmodule