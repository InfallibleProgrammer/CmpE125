set_property SRC_FILE_INFO {cfile:C:/Users/bcgni/shifter_rotator/shifter_rotator.srcs/constrs_1/new/shifter_rotator.xdc rfile:../../../shifter_rotator.srcs/constrs_1/new/shifter_rotator.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:1 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {clk100MHz}];
set_property src_info {type:XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports
{clk100MHz}];
set_property src_info {type:XDC file:1 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {rst}];
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports { SW2[0] }];
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports { SW2[1] }];
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports { SW2[2] }];
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports { SW2[3] }];
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports { SW1[0] }];
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN U11 IOSTANDARD LVCMOS33} [get_ports { SW1[1] }];
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports { SW1[2] }];
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports { LED[0] }];
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports { LED[1] }];
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports { LED[2] }];
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports { LED[3] }];
