create_clock -name clk -period 10.0 [get_ports clk]

set_clock_uncertainty 0.20 [get_clocks clk]

set_input_delay 2.0 -clock clk [get_ports rst]
set_input_delay 2.0 -clock clk [get_ports start]
set_input_delay 2.0 -clock clk [get_ports src_addr_in]
set_input_delay 2.0 -clock clk [get_ports dst_addr_in]
set_input_delay 2.0 -clock clk [get_ports transfer_length]

set_output_delay 2.0 -clock clk [get_ports src_addr]
set_output_delay 2.0 -clock clk [get_ports dst_addr]
set_output_delay 2.0 -clock clk [get_ports dma_busy]
set_output_delay 2.0 -clock clk [get_ports dma_done]
