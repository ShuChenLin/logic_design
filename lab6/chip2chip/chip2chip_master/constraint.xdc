set_property IOSTANDARD LVCMOS33 [get_ports {data_to_slave_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_to_slave_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_to_slave_o[0]}]
set_property PACKAGE_PIN G2 [get_ports {data_to_slave_o[2]}]
set_property PACKAGE_PIN J2 [get_ports {data_to_slave_o[1]}]
set_property PACKAGE_PIN L2 [get_ports {data_to_slave_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {in[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {in[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {in[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {in[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {in[0]}]
set_property PACKAGE_PIN V17 [get_ports {in[0]}]
set_property PACKAGE_PIN V16 [get_ports {in[1]}]
set_property PACKAGE_PIN W16 [get_ports {in[2]}]
set_property PACKAGE_PIN W17 [get_ports {in[3]}]
set_property PACKAGE_PIN W15 [get_ports {in[4]}]
set_property PACKAGE_PIN V15 [get_ports {in[5]}]
set_property PACKAGE_PIN W14 [get_ports {in[6]}]
set_property PACKAGE_PIN W13 [get_ports {in[7]}]

set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name clock -waveform {0.000 5.000} -add [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports ack]
set_property PACKAGE_PIN U16 [get_ports notice_master]
set_property IOSTANDARD LVCMOS33 [get_ports notice_master]
set_property PACKAGE_PIN U18 [get_ports request]
set_property IOSTANDARD LVCMOS33 [get_ports request]
set_property PACKAGE_PIN K2 [get_ports request2s]
set_property IOSTANDARD LVCMOS33 [get_ports request2s]
set_property PACKAGE_PIN T18 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
set_property PACKAGE_PIN H2 [get_ports valid]
set_property IOSTANDARD LVCMOS33 [get_ports valid]

set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]
set_property PACKAGE_PIN W4 [get_ports {AN[3]}]
set_property PACKAGE_PIN V4 [get_ports {AN[2]}]
set_property PACKAGE_PIN U4 [get_ports {AN[1]}]
set_property PACKAGE_PIN U2 [get_ports {AN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_seg[0]}]
set_property PACKAGE_PIN W7 [get_ports {seven_seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seven_seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seven_seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seven_seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seven_seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seven_seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seven_seg[6]}]

set_property PACKAGE_PIN G3 [get_ports ack]
