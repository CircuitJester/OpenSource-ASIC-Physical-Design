export DESIGN_NAME = timer
export PLATFORM    = nangate45

export VERILOG_FILES = /project/rtl/timer.v
export SDC_FILE      = /project/constraints/timer.sdc

export CORE_UTILIZATION = 18
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 2

export PLACE_DENSITY = 0.65
export PDN_TCL = /project/openroad/timer/pdn.tcl
