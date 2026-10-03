create_clock -name clk -period 10.0 [get_ports clk]

set_input_delay 1.0 -clock clk [get_ports rst]
set_input_delay 1.0 -clock clk [get_ports cpu_request]
set_input_delay 1.0 -clock clk [get_ports cpu_address]
set_input_delay 1.0 -clock clk [get_ports memory_data]
set_input_delay 1.0 -clock clk [get_ports memory_ready]

set_output_delay 1.0 -clock clk [get_ports cpu_hit]
set_output_delay 1.0 -clock clk [get_ports cpu_instruction]
set_output_delay 1.0 -clock clk [get_ports memory_request]
set_output_delay 1.0 -clock clk [get_ports memory_address]
