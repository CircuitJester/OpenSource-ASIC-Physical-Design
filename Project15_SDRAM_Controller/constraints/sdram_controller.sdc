create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports {
    rst
    read_request
    write_request
}]

set_output_delay 2 -clock clk [get_ports {
    cs_n
    ras_n
    cas_n
    we_n
}]

set_clock_uncertainty 0.2 [get_clocks clk]
