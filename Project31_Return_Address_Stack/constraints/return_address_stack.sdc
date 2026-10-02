create_clock -name clk -period 10.0 [get_ports clk]

set_input_delay 1.0 -clock clk [get_ports rst]
set_input_delay 1.0 -clock clk [get_ports push]
set_input_delay 1.0 -clock clk [get_ports pop]
set_input_delay 1.0 -clock clk [get_ports return_address]

set_output_delay 1.0 -clock clk [get_ports predicted_return_address]
set_output_delay 1.0 -clock clk [get_ports empty]
set_output_delay 1.0 -clock clk [get_ports full]
