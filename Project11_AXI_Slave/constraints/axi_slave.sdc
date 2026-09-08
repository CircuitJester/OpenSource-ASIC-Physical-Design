create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports {
    rst
    write_address
    write_data
    write_enable
    read_address
}]

set_output_delay 2 -clock clk [get_ports {
    read_data
}]

set_clock_uncertainty 0.2 [get_clocks clk]
