@echo off
REM ****************************************************************************
REM Vivado (TM) v2021.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Mon Mar 04 12:21:04 -0500 2024
REM SW Build 3367213 on Tue Oct 19 02:48:09 MDT 2021
REM
REM IP Build 3369179 on Thu Oct 21 08:25:16 MDT 2021
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab --incr --debug typical --relax --mt 2 -L xil_defaultlib -L axi_lite_ipif_v3_0_4 -L v_tc_v6_2_3 -L blk_mem_gen_v8_4_5 -L uvm -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot Host_Display_tb_behav xil_defaultlib.Host_Display_tb xil_defaultlib.glbl -log elaborate.log"
call xelab  --incr --debug typical --relax --mt 2 -L xil_defaultlib -L axi_lite_ipif_v3_0_4 -L v_tc_v6_2_3 -L blk_mem_gen_v8_4_5 -L uvm -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot Host_Display_tb_behav xil_defaultlib.Host_Display_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
