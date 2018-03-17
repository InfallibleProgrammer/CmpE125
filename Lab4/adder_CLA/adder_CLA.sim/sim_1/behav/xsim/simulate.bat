@echo off
REM ****************************************************************************
REM Vivado (TM) v2017.4.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sat Mar 10 21:48:13 -0800 2018
REM SW Build 2117270 on Tue Jan 30 15:32:00 MST 2018
REM
REM Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
call xsim tb_adder_CLA_behav -key {Behavioral:sim_1:Functional:tb_adder_CLA} -tclbatch tb_adder_CLA.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
