create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports {
    rst
    start_write
    start_read
    write_address
    read_address
    write_data
    awready
    wready
    bresp
    bvalid
    arready
    rdata
    rvalid
}]

set_output_delay 2 -clock clk [get_ports {
    awaddr
    awvalid
    wdata
    wvalid
    bready
    araddr
    arvalid
    rready
    data_out
    done
}]

set_clock_uncertainty 0.2 [get_clocks clk]
