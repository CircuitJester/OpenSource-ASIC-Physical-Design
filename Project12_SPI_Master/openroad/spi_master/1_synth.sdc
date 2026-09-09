###############################################################################
# Created by write_sdc
###############################################################################
current_design spi_master_top
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_uncertainty 0.2000 clk
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {miso}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {start}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {busy}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {cs_n}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {mosi}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spi_clk}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
