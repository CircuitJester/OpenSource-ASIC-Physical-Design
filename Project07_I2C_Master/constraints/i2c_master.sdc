create_clock -name clk -period 10 [get_ports clk]

create_generated_clock \
    -name scl \
    -source [get_ports clk] \
    -divide_by 10 \
    [get_ports scl]

set_input_delay 2 -clock clk [get_ports {rst start data_in clk_divider}]
set_input_delay 2 -clock scl [get_ports sda_in]

set_output_delay 2 -clock scl [get_ports {sda busy}]

set_clock_uncertainty 0.2 [get_clocks {clk scl}]
