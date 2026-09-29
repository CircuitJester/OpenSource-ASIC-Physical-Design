export DESIGN_NICKNAME = branch_prediction_unit
export DESIGN_NAME = branch_prediction_unit
export PLATFORM = nangate45

export VERILOG_FILES = $(DESIGN_HOME)/src/branch_prediction_unit/branch_prediction_unit_mapped.v
export SDC_FILE = $(DESIGN_HOME)/src/branch_prediction_unit/branch_prediction_unit.sdc

export PLACE_DENSITY = 0.30

export DIE_AREA = 0 0 45 45
export CORE_AREA = 5 5 40 40

export CLOCK_PERIOD = 10.0

export SKIP_CTS_REPAIR_TIMING = 1
export OPT_POST_GRT_WNS = 0
export HOLD_SLACK_MARGIN = -0.05
