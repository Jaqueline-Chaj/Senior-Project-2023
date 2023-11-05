// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
<<<<<<< HEAD
// Date        : Thu Oct 12 15:55:26 2023
// Host        : ARM144-12 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               h:/Senior-Project-2023/SENIOR_PROJECT/DIGLENT_BLOCK/DIGLENT_BLOCK.gen/sources_1/ip/clk_wiz_0_1/clk_wiz_0_stub.v
=======
// Date        : Mon Oct  9 17:00:37 2023
// Host        : ARM144-11 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               h:/Senior-Project-2023/SENIOR_PROJECT/DIGLENT_BLOCK/DIGLENT_BLOCK.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
>>>>>>> 9c971ac2998e47faaabea0845235ccde257fe477
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
<<<<<<< HEAD
module clk_wiz_0(clk_out1, reset, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,reset,clk_in1" */;
  output clk_out1;
  input reset;
=======
module clk_wiz_0(clk_out1, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,reset,locked,clk_in1" */;
  output clk_out1;
  input reset;
  output locked;
>>>>>>> 9c971ac2998e47faaabea0845235ccde257fe477
  input clk_in1;
endmodule
