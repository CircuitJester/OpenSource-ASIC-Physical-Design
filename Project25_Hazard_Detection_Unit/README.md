# Project25 - Hazard Detection Unit

## Overview
Physical-design implementation of the Hazard Detection Unit using the
Nangate45 platform and OpenROAD-flow-scripts.

## Design Inputs
- Mapped Verilog netlist: `openroad/src/hazard_detection_unit/hazard_detection_unit_mapped.v`
- OpenROAD configuration: `openroad/hazard_detection_unit/config.mk`
- Timing constraints: `openroad/src/hazard_detection_unit/hazard_detection_unit.sdc`
- Additional constraints: `constraints/hazard_detection_unit.sdc`

## Physical-Design Progress
The flow reached placement, clock-tree synthesis, routing, filler-cell
insertion, and GDS generation.

Selected final outputs are stored under:
`openroad/results/nangate45/hazard_detection_unit/base/`

## Status and Limitations
- The final report stage terminated with an `illegal instruction` error.
- Timing reports contain no constrained minimum or maximum paths.
- An input-to-output path was reported as unconstrained.
- The generated GDS had a DBU mismatch warning during merge.
- A final SPEF file was not generated.

Therefore, this project should not be considered fully timing-validated
or signoff-complete.

## Tools and Platform
- OpenROAD-flow-scripts
- Docker
- Nangate45
