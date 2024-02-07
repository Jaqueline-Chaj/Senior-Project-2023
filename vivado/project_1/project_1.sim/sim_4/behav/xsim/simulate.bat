@echo off
REM ****************************************************************************
REM Vivado (TM) v2021.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Feb 07 13:44:10 -0500 2024
REM SW Build 3367213 on Tue Oct 19 02:48:09 MDT 2021
REM
REM IP Build 3369179 on Thu Oct 21 08:25:16 MDT 2021
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim topleveltb_behav -key {Behavioral:sim_4:Functional:topleveltb} -tclbatch topleveltb.tcl -view H:/Senior-Project-2023/vivado/project_1/topleveltb_behav.wcfg -log simulate.log"
call xsim  topleveltb_behav -key {Behavioral:sim_4:Functional:topleveltb} -tclbatch topleveltb.tcl -view H:/Senior-Project-2023/vivado/project_1/topleveltb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
