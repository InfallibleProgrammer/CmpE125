set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {clk100MHz}];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports{clk100MHz}];

##Input data
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {IN[0]}];
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {IN[1]}];
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {IN[2]}];
set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports {IN[3]}];

##Output data
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {OUT[0]}];
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {OUT[1]}];
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {OUT[2]}];
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {OUT[3]}];

##Control signals
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports {EN}];
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {RST}];
set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS33} [get_ports {WNR}];

##Output signals
set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports {EMPTY}];
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {FULL}];

##debounce button
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports {BUTTON}];