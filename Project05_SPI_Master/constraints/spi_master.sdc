create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports {rst start data_in clk_divider miso cpol}]
set_output_delay 2 -clock clk [get_ports {rx_data spi_clk mosi busy cs}]

set_clock_uncertainty 0.2 [get_clocks clk]
