create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports {
    rst
    start
    tx_data
    sda_in
}]

set_output_delay 2 -clock clk [get_ports {
    scl
    sda_out
    busy
    done
    ack_error
    rx_data
}]

set_clock_uncertainty 0.2 [get_clocks clk]
