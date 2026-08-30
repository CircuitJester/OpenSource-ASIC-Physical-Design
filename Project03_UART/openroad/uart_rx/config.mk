export DESIGN_NAME = uart_rx_fsm
export PLATFORM    = nangate45

export VERILOG_FILES = /project/rtl/uart_rx_fsm.v
export SDC_FILE      = /project/constraints/uart_rx_fsm.sdc

export CORE_UTILIZATION = 18
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 2

export PLACE_DENSITY = 0.65

export PDN_TCL = /project/openroad/uart_rx/pdn.tcl

# OpenROAD CTS timing-repair workaround
export SKIP_CTS_REPAIR_TIMING = 1
