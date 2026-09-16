create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports {
    rst
    irq
    mask_write
    mask_data
    cpu_ack
}]

set_output_delay 2 -clock clk [get_ports {
    cpu_interrupt
    busy
    interrupt_id
}]

set_clock_uncertainty 0.2 [get_clocks clk]
