###############################################################################
# Created by write_sdc
###############################################################################
current_design i2c_master_top
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_uncertainty 0.2000 clk
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {sda_in}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {start}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {tx_data[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ack_error}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {busy}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {done}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rx_data[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {scl}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {sda_out}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
