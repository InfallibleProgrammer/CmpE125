set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {clk100MHz}];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports
{clk100MHz}];

set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {rst}];

set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports { A[0] }];
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports { A[1] }];
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports { A[2] }];
set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports { A[3] }];
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports { A[4] }];
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports { A[5] }];
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports { A[6] }];
set_property -dict {PACKAGE_PIN R13 IOSTANDARD LVCMOS33} [get_ports { A[7] }];

set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports { LED[0] }];
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports { LED[1] }];
set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports { LED[2] }];
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports { VALID }];