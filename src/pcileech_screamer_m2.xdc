set_property PACKAGE_PIN Y26 [get_ports {ft601_be[0]}]
set_property PACKAGE_PIN Y25 [get_ports {ft601_be[1]}]
set_property PACKAGE_PIN AA25 [get_ports {ft601_be[2]}]
set_property PACKAGE_PIN AB26 [get_ports {ft601_be[3]}]
set_property PACKAGE_PIN B26 [get_ports {ft601_data[0]}]
set_property PACKAGE_PIN C26 [get_ports {ft601_data[1]}]
set_property PACKAGE_PIN D25 [get_ports {ft601_data[2]}]
set_property PACKAGE_PIN D26 [get_ports {ft601_data[3]}]
set_property PACKAGE_PIN E25 [get_ports {ft601_data[4]}]
set_property PACKAGE_PIN E26 [get_ports {ft601_data[5]}]
set_property PACKAGE_PIN F25 [get_ports {ft601_data[6]}]
set_property PACKAGE_PIN G24 [get_ports {ft601_data[7]}]
set_property PACKAGE_PIN G26 [get_ports {ft601_data[8]}]
set_property PACKAGE_PIN G25 [get_ports {ft601_data[9]}]
set_property PACKAGE_PIN H26 [get_ports {ft601_data[10]}]
set_property PACKAGE_PIN H24 [get_ports {ft601_data[11]}]
set_property PACKAGE_PIN J26 [get_ports {ft601_data[12]}]
set_property PACKAGE_PIN J25 [get_ports {ft601_data[13]}]
set_property PACKAGE_PIN K26 [get_ports {ft601_data[14]}]
set_property PACKAGE_PIN K25 [get_ports {ft601_data[15]}]
set_property PACKAGE_PIN L25 [get_ports {ft601_data[16]}]
set_property PACKAGE_PIN M26 [get_ports {ft601_data[17]}]
set_property PACKAGE_PIN M25 [get_ports {ft601_data[18]}]
set_property PACKAGE_PIN N26 [get_ports {ft601_data[19]}]
set_property PACKAGE_PIN N24 [get_ports {ft601_data[20]}]
set_property PACKAGE_PIN P26 [get_ports {ft601_data[21]}]
set_property PACKAGE_PIN P25 [get_ports {ft601_data[22]}]
set_property PACKAGE_PIN R26 [get_ports {ft601_data[23]}]
set_property PACKAGE_PIN R25 [get_ports {ft601_data[24]}]
set_property PACKAGE_PIN T25 [get_ports {ft601_data[25]}]
set_property PACKAGE_PIN U26 [get_ports {ft601_data[26]}]
set_property PACKAGE_PIN U25 [get_ports {ft601_data[27]}]
set_property PACKAGE_PIN V26 [get_ports {ft601_data[28]}]
set_property PACKAGE_PIN V24 [get_ports {ft601_data[29]}]
set_property PACKAGE_PIN W26 [get_ports {ft601_data[30]}]
set_property PACKAGE_PIN W25 [get_ports {ft601_data[31]}]
#
#
#
set_property PACKAGE_PIN AE26 [get_ports ft601_oe_n]
set_property PACKAGE_PIN AD25 [get_ports ft601_rd_n]
set_property PACKAGE_PIN AC26 [get_ports ft601_rxf_n]

#set_property PACKAGE_PIN AB18 [get_ports ft601_siwu_n]

set_property PACKAGE_PIN AB25 [get_ports ft601_txe_n]
set_property PACKAGE_PIN AD26 [get_ports ft601_wr_n]
#set_property PACKAGE_PIN N13  [get_ports ft601_rst_n]

set_property IOSTANDARD LVCMOS33 [get_ports {ft601_txe_n ft601_rxf_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {{ft601_be[*]} {ft601_data[*]}}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_wr_n ft601_rd_n ft601_oe_n}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ft601_wr_n ft601_rd_n ft601_oe_n ft601_siwu_n ft601_rst_n}]

set_property SLEW FAST [get_ports {{ft601_be[*]} {ft601_data[*]}}]
#set_property SLEW FAST [get_ports {ft601_wr_n ft601_rd_n ft601_oe_n ft601_siwu_n ft601_rst_n}]
set_property SLEW FAST [get_ports {ft601_wr_n ft601_rd_n ft601_oe_n}]

# USER LED
set_property PACKAGE_PIN W24 [get_ports user_led]
set_property IOSTANDARD LVCMOS33 [get_ports user_led]
#set_property PACKAGE_PIN G21 [get_ports user_ld1_n]
#set_property PACKAGE_PIN G22 [get_ports user_ld2_n]
#set_property PACKAGE_PIN F19 [get_ports user_sw1_n]
#set_property PACKAGE_PIN F20 [get_ports user_sw2_n]
#set_property IOSTANDARD LVCMOS33 [get_ports {user_ld1_n user_ld2_n user_sw1_n user_sw2_n}]

# SYSCLK
set_property PACKAGE_PIN Y23 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name net_clk -waveform {0.000 5.000} [get_ports clk]

# FT601 CLK
create_clock -period 10.000 -name net_ft601_clk -waveform {0.000 5.000} [get_ports ft601_clk]
set_property IOSTANDARD LVCMOS33 [get_ports ft601_clk]
set_property PACKAGE_PIN N21 [get_ports ft601_clk]

set_input_delay -clock [get_clocks net_ft601_clk] -min 6.5 [get_ports {ft601_data[*]}]
set_input_delay -clock [get_clocks net_ft601_clk] -max 7.0 [get_ports {ft601_data[*]}]
set_input_delay -clock [get_clocks net_ft601_clk] -min 6.5 [get_ports ft601_rxf_n]
set_input_delay -clock [get_clocks net_ft601_clk] -max 7.0 [get_ports ft601_rxf_n]
set_input_delay -clock [get_clocks net_ft601_clk] -min 6.5 [get_ports ft601_txe_n]
set_input_delay -clock [get_clocks net_ft601_clk] -max 7.0 [get_ports ft601_txe_n]

set_output_delay -clock [get_clocks net_ft601_clk] -max 1.0 [get_ports {ft601_wr_n ft601_rd_n ft601_oe_n}]
set_output_delay -clock [get_clocks net_ft601_clk] -min 4.8 [get_ports {ft601_wr_n ft601_rd_n ft601_oe_n}]
set_output_delay -clock [get_clocks net_ft601_clk] -max 1.0 [get_ports {{ft601_be[*]} {ft601_data[*]}}]
set_output_delay -clock [get_clocks net_ft601_clk] -min 4.8 [get_ports {{ft601_be[*]} {ft601_data[*]}}]

set_property IOB TRUE [get_cells i_pcileech_com/i_pcileech_ft601/FT601_OE_N_reg]
set_property IOB TRUE [get_cells i_pcileech_com/i_pcileech_ft601/FT601_RD_N_reg]
set_property IOB TRUE [get_cells i_pcileech_com/i_pcileech_ft601/FT601_WR_N_reg]
set_property IOB TRUE [get_cells i_pcileech_com/i_pcileech_ft601/FT601_DATA_OUT_reg[0][*]]

set_multicycle_path 2 -from [get_pins i_pcileech_com/i_pcileech_ft601/OE_reg/C] -to [get_ports {{ft601_be[*]} {ft601_data[*]}}]

set_false_path -from [get_pins {tickcount64_reg[*]/C}]
set_false_path -from [get_pins {i_pcileech_fifo/_pcie_core_config_reg[*]/C}]
set_false_path -from [get_pins i_pcileech_pcie_a7/i_pcie_7x_0/inst/inst/user_lnk_up_int_reg/C] -to [get_pins {i_pcileech_fifo/_cmd_tx_din_reg[16]/D}]
set_false_path -from [get_pins i_pcileech_pcie_a7/i_pcie_7x_0/inst/inst/user_reset_out_reg/C]

# PCIE CHANNEL 
set_property LOC GTXE2_CHANNEL_X0Y3 [get_cells {i_pcileech_pcie_a7/i_pcie_7x_0/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]

#PCIe signals
#set_property PACKAGE_PIN A13 [get_ports pcie_present]
set_property PACKAGE_PIN A9 [get_ports pcie_perst_n]
#set_property PACKAGE_PIN B13 [get_ports pcie_wake_n]

# SET IO Standard
#set_property IOSTANDARD LVCMOS33 [get_ports pcie_present]
set_property IOSTANDARD LVCMOS33 [get_ports pcie_perst_n]
#set_property IOSTANDARD LVCMOS33 [get_ports pcie_wake_n]

set_property PACKAGE_PIN J3 [get_ports {pcie_rx_n[0]}]
set_property PACKAGE_PIN J4 [get_ports {pcie_rx_p[0]}]
set_property PACKAGE_PIN H1 [get_ports {pcie_tx_n[0]}]
set_property PACKAGE_PIN H2 [get_ports {pcie_tx_p[0]}]

set_property PACKAGE_PIN K6 [get_ports pcie_clk_p]
set_property PACKAGE_PIN K5 [get_ports pcie_clk_n]

create_clock -name pcie_sys_clk_p -period 10.0 [get_nets pcie_clk_p]

set_property CFGBVS Vcco [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 66 [current_design]

set_clock_groups -asynchronous -group [get_clocks net_clk] -group [get_clocks net_ft601_clk]
