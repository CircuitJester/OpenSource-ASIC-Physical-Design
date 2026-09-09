create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports {
    rst
    start
    tx_data
    miso
}]

set_output_delay 2 -clock clk [get_ports {
    mosi
    spi_clk
    cs_n
    rx_data
    busy
}]

set_clock_uncertainty 0.2 [get_clocks clk]
