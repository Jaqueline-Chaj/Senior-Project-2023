`timescale 1ns / 1ps

module topleveltb(
    );
    
    logic clk;
    logic reset_n;
    logic [7:0] psoc_if_d;
    logic psoc_fpga_xfc;
    logic fpga_psoc_xfc;
    logic REG_WE;
    logic [31:0] REG_WR_DATA;
    logic reset;
    
    
    
    assign reset = ~reset_n;
    TopLevelInterface TLIF(
        .clk(clk),
        .reset_n(reset_n),
        .psoc_if_d(psoc_if_d),
        .psoc_fpga_xfc(psoc_fpga_xfc),
        .fpga_psoc_xfc(fpga_psoc_xfc),
        .REG_WE(REG_WE),
        .REG_WR_DATA(REG_WR_DATA)
    );
    
initial begin
    clk = 0;
    while(1)
        #5 clk = ~clk;
end

initial begin
    reset_n = 0;
    #87 reset_n = 1;
end

//dummy data being sent. Increments by 2 every cycle
always_ff @ (posedge clk)
begin
    if(reset)
        psoc_if_d <= 0;
    else
        psoc_if_d <= psoc_if_d + 4'b0010;
end

//fake psoc_fpga_xfc handshake signal
always_ff @ (posedge clk)
    if (reset)
        psoc_fpga_xfc <= 0;
    else if (fpga_psoc_xfc)
        psoc_fpga_xfc <= ~psoc_fpga_xfc;

endmodule
