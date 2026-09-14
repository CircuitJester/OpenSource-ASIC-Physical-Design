create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports {
    rst
    cpu_req
    dma_req
    eth_req
    gpu_req
}]

set_output_delay 2 -clock clk [get_ports {
    grant
    done
}]

set_clock_uncertainty 0.2 [get_clocks clk]
