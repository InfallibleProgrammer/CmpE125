@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim tb_parallel_multiplier_behav -key {Behavioral:sim_1:Functional:tb_parallel_multiplier} -tclbatch tb_parallel_multiplier.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
