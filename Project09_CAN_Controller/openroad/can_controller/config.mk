export DESIGN_NAME = can_controller
export DESIGN_NICKNAME = can_controller
export PLATFORM = nangate45

export VERILOG_FILES = /project/yosys/asic/can_controller_mapped.v
export SDC_FILE = /project/constraints/can_controller.sdc

export CORE_UTILIZATION = 30
export CORE_ASPECT_RATIO = 1.0
export CORE_MARGIN = 2

export PLACE_DENSITY = 0.30

export CLOCK_PERIOD = 10.0
export CLOCK_PORT = clk

export PDN_TCL = /OpenROAD-flow-scripts/flow/platforms/nangate45/grid_strategy-M1-M4-M7.tcl

export MIN_ROUTING_LAYER = metal2
export MIN_CLK_ROUTING_LAYER = metal4
export MAX_ROUTING_LAYER = metal10

export IO_PLACER_H = metal5
export IO_PLACER_V = metal6

export DETAILED_ROUTE_ARGS = -no_pin_access

export KLAYOUT_TECH_FILE = /OpenROAD-flow-scripts/flow/platforms/nangate45/FreePDK45.lyt
export KLAYOUT_DRC_FILE = /OpenROAD-flow-scripts/flow/platforms/nangate45/drc/FreePDK45.lydrc
