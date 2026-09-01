create_clock -name spi_clk -period 10 [get_ports spi_clk]

set_input_delay 2 -clock spi_clk [get_ports {rst cs mosi tx_data}]
set_output_delay 2 -clock spi_clk [get_ports {miso busy rx_data}]

set_clock_uncertainty 0.2 [get_clocks spi_clk]
