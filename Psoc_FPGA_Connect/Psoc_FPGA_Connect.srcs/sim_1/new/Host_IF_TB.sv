`timescale 1ns / 1ps

module tb(
    );

    logic [7:0] psoc_if_d; 
    logic psoc_fpga_xfc;
    logic psoc_fpga_xfc_prev;
    logic psoc_fpga_xfc_toggle;
    logic clk;
    logic reset;
    logic reset_d1;
    logic reset_n;
    logic fpga_psoc_xfc;
    logic fpga_psoc_xfc_prev;
    logic fpga_psoc_xfc_toggle;
    logic fpga_psoc_xfc_toggle_d1;
    
    logic clk, reset_n,psoc_reset_raw;
    //logic[7:0] host_hostif_d;
    logic hdmi_tx_clk_p;
    logic hdmi_tx_clk_n;
    logic[2:0] hdmi_tx_p, hdmi_tx_n;  
    
    Host_to_Display_top Host(.clk(clk),
    .reset_n(reset_n),
    .psoc_reset_raw(psoc_reset_raw),
    .host_hostif_d(data),
    .host_hostif_host_xfc_raw(psoc_fpga_xfc),
    .host_hostif_fpga_xfc(fpga_psoc_xfc),
    .hdmi_tx_clk_p(hdmi_tx_clk_p),
    .hdmi_tx_clk_n(hdmi_tx_clk_n),
    .hdmi_tx_p(hdmi_tx_p),
    .hdmi_tx_n(hdmi_tx_n) 
    );
 
   
    assign psoc_fpga_xfc_toggle = psoc_fpga_xfc != psoc_fpga_xfc_prev;
    assign fpga_psoc_xfc_toggle = fpga_psoc_xfc != fpga_psoc_xfc_prev;
    assign reset = ~reset_n;
    

    
initial begin
    clk = 0;
    while (1)
        #5 clk = ~clk;
end
    
 initial begin
 reset_n=0;
 psoc_reset_raw=1;
 #87 reset_n=1;
  psoc_reset_raw=0;
  end
    
    

    
    
always_ff @ (posedge clk)
begin
    if (psoc_reset_raw)
    begin
        psoc_fpga_xfc_prev <= 0;
        fpga_psoc_xfc_prev <= 0;
    end
    else
    begin
        psoc_fpga_xfc_prev <= psoc_fpga_xfc;
        fpga_psoc_xfc_prev <= fpga_psoc_xfc;    
    end
end


always_ff @ (posedge clk)
begin
    if (psoc_reset_raw)
        psoc_fpga_xfc <= 0;
    else if (fpga_psoc_xfc_toggle_d1 || reset_d1)
        psoc_fpga_xfc <= ~psoc_fpga_xfc;
end   


always_ff @ (posedge clk)
begin
    reset_d1 <= psoc_reset_raw;
    if (psoc_reset_raw)
        fpga_psoc_xfc_toggle_d1 <=0;
    else 
        fpga_psoc_xfc_toggle_d1 <= fpga_psoc_xfc_toggle;
end


logic [7:0] master_counter;
logic [7:0] data_counter;
logic [7:0] addr_counter;
logic [7:0] data;

//master count
always @(posedge clk)
begin
	if (reset)
 		master_counter <= 0;
	else 
		master_counter <= master_counter+1;
end

//data count
always @ (posedge clk)
begin
	if(psoc_reset_raw)
		data_counter <= 0;
	else if(master_counter %5 != 0)
		data_counter <= 1;
end

//addr_count
always @(posedge clk)
begin
	if(psoc_reset_raw)
		addr_counter = 0;
	else if(master_counter %5 == 0)
		addr_counter = 4;
end 

always @(posedge clk)
begin
	if(psoc_reset_raw)
		data <= 0;
	else if(master_counter% 5 == 0)
		data <= addr_counter;
	else if(master_counter %5 != 0)
		data <= data_counter;
end
    
endmodule
