# Project29 — Two-Bit Branch Predictor

## Overview

This project implements the physical design of a sequential two-bit branch predictor using the open-source OpenROAD ASIC flow and Nangate45 technology library.

The predictor uses a 2-bit saturating state machine with four prediction states:

- Strongly Not Taken
- Weakly Not Taken
- Weakly Taken
- Strongly Taken

The prediction state is updated on the rising edge of `clk`.

## Design

### Inputs
- `clk`
- `rst`
- `update_enable`
- `branch_taken_actual`

### Output
- `predict_taken`

## RTL / Synthesis

RTL development, simulation, and Yosys synthesis were completed separately in:

`../Verilog_projects/Verilog_Project29`

The mapped netlist used for the physical-design flow is:

`two_bit_branch_predictor_mapped.v`

## Physical Design

Technology:
- Nangate45

Clock:
- `clk`
- Period: 10 ns
- Frequency: 100 MHz

Floorplan:
- Die area: 45 × 45 µm
- Core area: 35 × 35 µm
- Placement density: 0.30

The OpenROAD flow included:

1. Netlist import
2. Floorplanning
3. Tapcell insertion
4. PDN generation
5. Global placement
6. Placement optimization
7. Clock-tree synthesis
8. Global routing
9. Detailed routing
10. Filler-cell insertion
11. Final physical artifact generation

## Final Physical Results

| Parameter | Result |
|---|---:|
| Design area | ~57 µm² |
| Utilization | ~5% |
| Detailed-route wire length | 217 µm |
| Total vias | 176 |
| Detailed-route violations | 0 |
| Antenna net violations | 0 |
| Antenna pin violations | 0 |
| Filler instances | 205 |

## Timing Results

The design has a real clock constraint and timing was analyzed during the physical-design flow.

| Metric | Result |
|---|---:|
| Clock period | 10.00 ns |
| WNS | 0.00 ns |
| TNS | 0.00 ns |
| Worst reported slack | 8.82 ns |
| Setup violations | 0 |
| Hold violations | 0 |
| Max slew violations | 0 |
| Max fanout violations | 0 |
| Max capacitance violations | 0 |

The reported timing paths include `predict_taken` as an endpoint and show positive slack.

## Final Artifacts

The final physical-design artifacts are stored under:

`openroad/results/nangate45/two_bit_branch_predictor/base/`

Files:

- `6_final.def`
- `6_final.odb`
- `6_final.sdc`
- `6_final.v`

## Limitations

The final OpenROAD reporting stage terminated with an `illegal instruction` error after the final ODB and SDC files had already been written.

Therefore, the physical-design results generated before the crash are retained, but full final reporting/signoff is not claimed.

No final GDS artifact was generated in this run.

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

Routing:
- Detailed-route violations: 0
- Antenna violations: 0

Timing:
- WNS: 0.00 ns
- TNS: 0.00 ns
- Setup violations: 0
- Hold violations: 0

Final signoff:
- Not claimed
