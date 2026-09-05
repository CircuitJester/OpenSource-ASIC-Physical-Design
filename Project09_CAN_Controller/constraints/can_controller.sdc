create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports {rst start identifier data stuffing_done crc_done tx_done frame_received crc_valid ack_received}]

set_output_delay 2 -clock clk [get_ports {load_frame start_stuffing start_crc transmit busy ack frame stuffed_frame crc}]

set_clock_uncertainty 0.2 [get_clocks clk]
