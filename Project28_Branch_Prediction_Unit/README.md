# Project28 — Branch Prediction Unit

## Overview

This project implements the physical design flow of a combinational Branch Prediction Unit using the open-source OpenROAD ASIC flow with the Nangate45 technology library.

The RTL design predicts a branch as taken when `branch_valid` is asserted and calculates the predicted program counter using the supplied branch offset.

## Design

### Inputs
- `current_pc` — 32-bit current program counter
- `branch_offset` — 32-bit branch offset
- `branch_valid` — Branch validity control

### Outputs
- `predict_taken` — Branch prediction result
- `predicted_pc` — Predicted program counter

## RTL / Synthesis

RTL development, simulation, and Yosys synthesis were completed separately in:

`../Verilog_projects/Verilog_Project28`

The mapped netlist used for the physical-design flow is:

`branch_prediction_unit_mapped.v`

## Physical Design Flow

The OpenROAD flow included:

1. Synthesis netlist import
2. Floorplanning
3. Tapcell insertion
4. Power distribution network generation
5. Global placement
6. Placement optimization
7. Clock-tree stage
8. Global routing
9. Detailed routing
10. Filler-cell insertion
11. Final DEF/ODB/netlist generation

Technology:
- Nangate45

Die area:
- 45 × 45 µm

Core area:
- 35 × 35 µm

Placement density:
- 0.30

## Final Physical Results

| Parameter | Result |
|---|---:|
| Design area | ~612 µm² |
| Utilization | ~52% |
| Detailed-route wire length | 3455 µm |
| Total vias | 3011 |
| Detailed-route violations | 0 |
| Antenna net violations | 0 |
| Antenna pin violations | 0 |
| Filler instances | 502 |

## Final Artifacts

The final physical-design artifacts are stored under:

`openroad/results/nangate45/branch_prediction_unit/base/`

Files include:

- `6_final.def`
- `6_final.odb`
- `6_final.sdc`
- `6_final.v`
- `6_final_lec.v`

## Notes and Limitations

The OpenROAD flow successfully completed floorplanning, placement, routing, and filler insertion, with zero detailed-routing and antenna violations reported.

The final reporting stage terminated with an `illegal instruction` error after the final ODB and SDC files had already been written. Therefore, the generated final physical-design artifacts are retained, but full final reporting/signoff was not claimed.

No final GDS artifact was generated in this run.

Timing closure and signoff should not be inferred from this run because the design is combinational and the generated reports contain unconstrained timing paths.

## Tools

- Verilog
- Yosys
- OpenROAD
- OpenROAD-flow-scripts
- Nangate45
- Docker
- WSL2 / Ubuntu

## Project Status

**OpenROAD Physical Design: Completed**

Final routing:
- DRC routing violations: 0
- Antenna violations: 0

Final signoff:
- Not claimed
