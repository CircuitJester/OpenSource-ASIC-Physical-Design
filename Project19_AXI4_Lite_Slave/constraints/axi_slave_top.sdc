create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports {
    rst
    awvalid
    wvalid
    bready
    arvalid
    rready
    address
    write_data
}]

set_output_delay 2 -clock clk [get_ports {
    read_data
    awready
    wready
    bvalid
    arready
    rvalid
}]

set_clock_uncertainty 0.2 [get_clocks clk]
