create_clock -name clk -period 10.0 [get_ports clk]

set_clock_uncertainty 0.20 [get_clocks clk]

set_input_delay 2.0 -clock clk [get_ports rst]
set_input_delay 2.0 -clock clk [get_ports opcode]
set_input_delay 2.0 -clock clk [get_ports operand_a]
set_input_delay 2.0 -clock clk [get_ports operand_b]
set_input_delay 2.0 -clock clk [get_ports carry_out]
set_input_delay 2.0 -clock clk [get_ports overflow]

set_output_delay 2.0 -clock clk [get_ports result]
set_output_delay 2.0 -clock clk [get_ports zero]
set_output_delay 2.0 -clock clk [get_ports carry]
set_output_delay 2.0 -clock clk [get_ports negative]
set_output_delay 2.0 -clock clk [get_ports overflow_flag]
