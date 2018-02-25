set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {clk100MHz}];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports
{clk100MHz}];

set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {rst}];

set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports { SW2[0] }];
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports { SW2[1] }];
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports { SW2[2] }];
set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports { SW2[3] }];

set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports { SW1[0] }];
set_property -dict {PACKAGE_PIN U11 IOSTANDARD LVCMOS33} [get_ports { SW1[1] }];
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports { SW1[2] }];

set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports { LED[0] }];
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports { LED[1] }];
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports { LED[2] }];
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports { LED[3] }];