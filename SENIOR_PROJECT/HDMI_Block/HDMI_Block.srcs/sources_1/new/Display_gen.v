`timescale 1ns / 1ps

module Display_gen(
    input clk,
    input link_clk,
   input resetn,
  
  
  // HDMI monitor info exchange interface
  input  DDC_OUT_scl_i,
  output DDC_OUT_scl_o,
  output DDC_OUT_scl_t,
  input  DDC_OUT_sda_i,
  output DDC_OUT_sda_o,
  output DDC_OUT_sda_t,
  
  
  
  // HDMI signals that carry audio and clk
 output[19:0] LINK_DATA0_OUT_tdata,
 output LINK_DATA0_OUT_tvalid,
 output[19:0] LINK_DATA1_OUT_tdata,
 output LINK_DATA1_OUT_tvalid,
 output[19:0] LINK_DATA2_OUT_tdata,
  output LINK_DATA2_OUT_tvalid
  );
logic NATIVE_VID_IN_active_video,
  NATIVE_VID_IN_hsync,
  NATIVE_VID_IN_vsync,
   SB_STATUS_IN_tdata,
  SB_STATUS_IN_tvalid,
  AUDIO_IN_tdata,
  AUDIO_IN_tid,
  AUDIO_IN_tready,
  AUDIO_IN_tvalid,
  S_AXI_CPU_IN_araddr,
  S_AXI_CPU_IN_arprot,
  S_AXI_CPU_IN_arready,
  S_AXI_CPU_IN_arvalid,
  S_AXI_CPU_IN_awaddr,
  S_AXI_CPU_IN_awprot,
  S_AXI_CPU_IN_awready,
  S_AXI_CPU_IN_awvalid,
  S_AXI_CPU_IN_bready,
  S_AXI_CPU_IN_bresp,
  S_AXI_CPU_IN_bvalid,
  S_AXI_CPU_IN_rdata,
  S_AXI_CPU_IN_rready,
  S_AXI_CPU_IN_rresp,
  S_AXI_CPU_IN_rvalid,
  S_AXI_CPU_IN_wdata,
  S_AXI_CPU_IN_wready,
  S_AXI_CPU_IN_wstrb,
  S_AXI_CPU_IN_wvalid,
    s_axi_cpu_aclk,
  s_axi_cpu_aresetn,
  link_clk,
  s_axis_audio_aclk,
  s_axis_audio_aresetn,
  acr_cts,
  acr_n,
  acr_valid,
  hpd,
  irq,
  video_clk,
  sof_state,
  hblank_out,
  vblank_out,
  hsync_out,
  vsync_out,
  video_rst;
  
 assign sof_state=1'b0;
 logic [47:0]   NATIVE_VID_IN_data;
 
 assign   NATIVE_VID_IN_data= 48'h 00_FF_00__00_FF_00;
 
 VTC vtc(
 .clk(clk),
 
 .clken(1'b1),
 .gen_clken(1'b1),
 .resetn(resetn),
 .sof_state(sof_state),
 .active_video_out(NATIVE_VID_IN_active_video),
 .hsync_out(NATIVE_VID_IN_hsync),
 .vsync_out(NATIVE_VID_IN_vsync)
 
 
 
 );
 
  HDMI_transmitter HDMI(
  /* input  */   .s_axi_cpu_aclk         (clk     ),
/* input  */   .s_axi_cpu_aresetn      (resetn   ),
/* input  */   .link_clk               (link_clk           ),
/* input  */   .s_axis_audio_aclk      (clk ),
/* input  */   .s_axis_audio_aresetn   (resetn),
                                                             
/* input  */   .acr_cts                (20'b0              ),
/* input  */   .acr_n                  (20'b0                ),
/* input  */   .acr_valid              (1'b1            ),
/* input  */   .hpd                    (1'b0                  ),
/* output */   .irq                    (irq                 ),
/* output */   .video_rst              (video_rst ),
                                                             
/* input  */   .video_clk              (clk           ),
/* input  */   .NATIVE_VID_IN_active_video  (NATIVE_VID_IN_active_video),
/* input  */   .NATIVE_VID_IN_data         (NATIVE_VID_IN_data     ),
/* input  */   .NATIVE_VID_IN_hsync         (NATIVE_VID_IN_hsync    ),
/* input  */   .NATIVE_VID_IN_vsync        (NATIVE_VID_IN_vsync      ),
                                                             
/* input  */   .SB_STATUS_IN_tdata     (2'b0  ),
/* input  */   .SB_STATUS_IN_tvalid    (1'b1 ),
                                                             
/* input  */   .AUDIO_IN_tdata         (32'b0    ),
/* input  */   .AUDIO_IN_tid           (8'b0     ),
/* output */   .AUDIO_IN_tready        (AUDIO_IN_tready      ),
/* input  */   .AUDIO_IN_tvalid        (1'b1    ),
                                                             
/* input  */   .S_AXI_CPU_IN_araddr    (9'b0 ),
/* input  */   .S_AXI_CPU_IN_arprot    (3'b0  ),
                                                             
/* output */   .S_AXI_CPU_IN_arready   (S_AXI_CPU_IN_arready),
/* input  */   .S_AXI_CPU_IN_arvalid   (1'b1 ),
/* input  */   .S_AXI_CPU_IN_awaddr    (9'b0  ),
/* input  */   .S_AXI_CPU_IN_awprot    (3'b0  ),
/* output */   .S_AXI_CPU_IN_awready   (S_AXI_CPU_IN_awready ),
/* input  */   .S_AXI_CPU_IN_awvalid   (1'b1 ),
/* input  */   .S_AXI_CPU_IN_bready    (1'b0 ),
/* output */   .S_AXI_CPU_IN_bresp     (S_AXI_CPU_IN_bresp  ),
/* output */   .S_AXI_CPU_IN_bvalid    (S_AXI_CPU_IN_bvalid ),
/* output */   .S_AXI_CPU_IN_rdata     (S_AXI_CPU_IN_rdata   ),
/* input  */   .S_AXI_CPU_IN_rready    (1'b0  ),
/* output */   .S_AXI_CPU_IN_rresp     (S_AXI_CPU_IN_rresp   ),
/* output */   .S_AXI_CPU_IN_rvalid    (S_AXI_CPU_IN_rvalid  ),
/* input  */   .S_AXI_CPU_IN_wdata     (32'b0 ),
/* output */   .S_AXI_CPU_IN_wready    (S_AXI_CPU_IN_wready  ),
/* input  */   .S_AXI_CPU_IN_wstrb     (4'b0   ),
/* input  */   .S_AXI_CPU_IN_wvalid    (1'b1  ),
                                                             
/* input  */   .DDC_OUT_scl_i          (1'b0      ),
/* output */   .DDC_OUT_scl_o          (DDC_OUT_scl_o        ),
/* output */   .DDC_OUT_scl_t          (DDC_OUT_scl_t        ),
/* input  */   .DDC_OUT_sda_i          (1'b0        ),
/* output */   .DDC_OUT_sda_o          (DDC_OUT_sda_o        ),
/* output */   .DDC_OUT_sda_t          (DDC_OUT_sda_t        ),
/* output */   .LINK_DATA0_OUT_tdata   (LINK_DATA0_OUT_tdata ),
/* output */   .LINK_DATA0_OUT_tvalid  (LINK_DATA0_OUT_tvalid),
/* output */   .LINK_DATA1_OUT_tdata   (LINK_DATA1_OUT_tdata ),
/* output */   .LINK_DATA1_OUT_tvalid  (LINK_DATA1_OUT_tvalid),
/* output */   .LINK_DATA2_OUT_tdata   (LINK_DATA2_OUT_tdata ),
/* output */   .LINK_DATA2_OUT_tvalid  (LINK_DATA2_OUT_tvalid)

);
endmodule
