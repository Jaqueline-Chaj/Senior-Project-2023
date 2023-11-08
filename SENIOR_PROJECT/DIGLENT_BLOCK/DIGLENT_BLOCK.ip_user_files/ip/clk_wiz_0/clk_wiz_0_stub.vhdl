-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
<<<<<<< HEAD
-- Date        : Thu Oct 12 15:55:26 2023
-- Host        : ARM144-12 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               h:/Senior-Project-2023/SENIOR_PROJECT/DIGLENT_BLOCK/DIGLENT_BLOCK.gen/sources_1/ip/clk_wiz_0_1/clk_wiz_0_stub.vhdl
=======
-- Date        : Mon Oct  9 17:00:37 2023
-- Host        : ARM144-11 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               h:/Senior-Project-2023/SENIOR_PROJECT/DIGLENT_BLOCK/DIGLENT_BLOCK.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.vhdl
>>>>>>> 9c971ac2998e47faaabea0845235ccde257fe477
-- Design      : clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
<<<<<<< HEAD
=======
    locked : out STD_LOGIC;
>>>>>>> 9c971ac2998e47faaabea0845235ccde257fe477
    clk_in1 : in STD_LOGIC
  );

end clk_wiz_0;

architecture stub of clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
<<<<<<< HEAD
attribute black_box_pad_pin of stub : architecture is "clk_out1,reset,clk_in1";
=======
attribute black_box_pad_pin of stub : architecture is "clk_out1,reset,locked,clk_in1";
>>>>>>> 9c971ac2998e47faaabea0845235ccde257fe477
begin
end;
