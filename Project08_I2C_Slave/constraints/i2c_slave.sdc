create_clock -name scl -period 10 [get_ports scl]

set_input_delay 2 -clock scl [get_ports {rst start_detected stop_detected sda received_address}]

set_output_delay 2 -clock scl [get_ports {ack busy rx_data}]

set_clock_uncertainty 0.2 [get_clocks scl]
