create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports {
    rst
    tx_start
    tx_data
    rx
}]

set_output_delay 2 -clock clk [get_ports {
    tx_busy
    tx_done
    tx
    rx_data
    rx_busy
    rx_done
}]

set_clock_uncertainty 0.2 [get_clocks clk]
