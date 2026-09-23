export DESIGN_NICKNAME = hazard_detection_unit
export DESIGN_NAME = hazard_detection_unit
export PLATFORM = nangate45

export VERILOG_FILES = $(DESIGN_HOME)/src/hazard_detection_unit/hazard_detection_unit_mapped.v
export SDC_FILE = $(DESIGN_HOME)/src/hazard_detection_unit/hazard_detection_unit.sdc

export PLACE_DENSITY = 0.30
export DIE_AREA = 0 0 50 50
export CORE_AREA = 5 5 45 45

export CLOCK_PERIOD = 10.0

export SKIP_CTS_REPAIR_TIMING = 1
export OPT_POST_GRT_WNS = 0
export HOLD_SLACK_MARGIN = -0.05
