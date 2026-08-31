# Project 05 — SPI Master ASIC Flow

## Overview

Project 05 focuses on designing and implementing a reusable SPI Master RTL IP block and taking the design through the ASIC physical-design flow using OpenROAD.

The SPI Master contains dedicated logic for serial data transmission, serial data reception, SPI clock generation, transfer control, and bit counting.

The original RTL design and Yosys synthesis artifacts were already completed as part of the Verilog RTL portfolio. Therefore, the existing synthesized netlist and schematic were reused for the ASIC implementation rather than repeating the Yosys synthesis stage.

This project extends the workflow from RTL and synthesis into complete ASIC physical implementation and final GDSII generation.

---

## Design Architecture

The SPI Master is composed of five RTL blocks:

- SPI Master
- SPI Master FSM
- SPI Shift Register
- SPI Bit Counter
- SPI Clock Generator

The main SPI Master interface provides:

- Transfer start control
- Parallel transmit data
- Parallel received data
- SPI clock output
- MOSI output
- MISO input
- Chip-select control
- Busy status
- Configurable clock divider
- CPOL control

---

## IP Blocks

### 1. SPI Master

The top-level SPI Master integrates the individual SPI control and datapath blocks.

It coordinates:

- Transfer initiation
- SPI clock generation
- Serial data transmission
- Serial data reception
- Bit counting
- Chip-select control
- Busy-state control

The top-level module connects the FSM, shift register, bit counter, and clock generator into a complete SPI controller.

---

### 2. SPI Master FSM

The SPI Master FSM controls the overall SPI transfer sequence.

The FSM manages:

- Idle state
- Transfer start
- Data loading
- Serial shifting
- Transfer completion
- Busy control
- Chip-select control

The state machine provides the control path required to coordinate the SPI datapath.

---

### 3. SPI Shift Register

The shift register handles serial data transmission and reception.

The transmit path shifts data toward the MOSI output while the receive path captures incoming MISO data.

Key concepts:

- Parallel data loading
- Serial shifting
- MOSI generation
- MISO sampling
- Receive-data accumulation
- Synchronous reset behavior

The synthesized design contains the parameterized shift-register implementation mapped into standard cells.

---

### 4. SPI Bit Counter

The bit counter tracks the number of transferred SPI bits.

The counter provides:

- Transfer progress tracking
- Bit completion detection
- Counter reset
- Enable-controlled counting
- Eight-bit transfer completion detection

The counter is used by the FSM to determine when the SPI transfer has completed.

---

### 5. SPI Clock Generator

The clock generator produces the SPI clock from the system clock.

The SPI clock frequency is controlled using the configurable clock-divider input.

Key concepts:

- Clock division
- Clock toggling
- Reset initialization
- Synchronous counter operation
- SPI clock generation

The RTL was updated so that the reset state initializes the SPI clock to a deterministic low level before normal clock generation begins.

---

## Design Flow

The project uses the existing synthesized Yosys artifacts and continues from the ASIC physical-design stages:

    Existing Synthesized Netlist

            |

            v

       OpenROAD

            |

            +--> Floorplanning

            |

            +--> Power Distribution Network

            |

            +--> Placement

            |

            +--> Clock Tree Synthesis

            |

            +--> Timing Repair

            |

            +--> Global Routing

            |

            +--> Detailed Routing

            |

            +--> Filler Cell Insertion

            |

            +--> Density Fill

            |

            +--> RC Extraction

            |

            +--> IR-Drop Analysis

            |

            v

       Final Signoff

            |

            +--> ODB

            +--> DEF

            +--> SDC

            +--> GDSII

---

## Existing Yosys Artifacts

The RTL-to-Yosys synthesis stage had already been completed in the Verilog portfolio.

The existing synthesized artifacts were reused from:

    Verilog_Project05/synth/

The available synthesized netlists included:

- spi_bit_counter_netlist.v
- spi_clock_generator_netlist.v
- spi_master_fsm_netlist.v
- spi_master_netlist.v
- spi_shift_register_netlist.v

The existing SPI Master schematic was also reused:

    spi_master.svg

The top-level synthesized netlist contains:

    spi_master

    spi_master_fsm

    spi_clock_generator

    spi_bit_counter

    spi_shift_register

This avoids duplicating work that had already been completed in the Verilog/Yosys portfolio.

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Verilog | RTL design |
| Icarus Verilog | RTL simulation |
| GTKWave | Waveform analysis |
| Yosys | Existing RTL synthesis |
| OpenROAD | ASIC physical implementation |
| OpenROAD-flow-scripts | Automated physical-design flow |
| KLayout | GDSII stream generation |
| Nangate45 | Target standard-cell technology |
| Docker | Reproducible EDA environment |
| Git | Version control |

---

## RTL Verification

The SPI Master RTL was already developed and simulated before entering the ASIC physical-design flow.

The existing simulation was rerun after the SPI clock-generator reset behavior was corrected.

The SPI Master simulation completed successfully:

    VCD info: dumpfile spi_master.vcd opened for output.

    $finish called at 500000

The SPI Clock Generator simulation also completed successfully:

    VCD info: dumpfile spi_clock.vcd opened for output.

    $finish called at 210

The corrected RTL therefore passed the existing simulation flow before physical implementation continued.

---

## RTL Correction

During the physical-design preparation, the SPI clock generator was reviewed.

The original reset behavior initialized the SPI clock using the CPOL input:

    spi_clk <= cpol;

This caused the reset value of the generated clock to depend directly on an external input.

The reset behavior was changed to a deterministic low state:

    spi_clk <= 1'b0;

The updated RTL was then simulated again.

A backup of the original RTL was retained:

    spi_clock_generator.v.bak

This change was made at the RTL level before continuing with the ASIC physical-design flow.

---

## Timing Constraints

The SPI Master uses a 10 ns primary clock constraint:

    create_clock -name clk -period 10 [get_ports clk]

Input delays were defined relative to the system clock.

Output delays were also defined relative to the system clock.

Clock uncertainty was configured as:

    0.2 ns

The complete timing constraint file is:

    constraints/spi_master.sdc

---

## OpenROAD Configuration

The ASIC implementation uses the Nangate45 standard-cell technology.

The main OpenROAD configuration contains:

    DESIGN_NAME = spi_master

    PLATFORM = nangate45

    CORE_UTILIZATION = 18

    CORE_ASPECT_RATIO = 1

    CORE_MARGIN = 2

    PLACE_DENSITY = 0.65

The OpenROAD implementation results are stored under:

    layout/orfs_results/

---

## Power Distribution Network

The initial PDN configuration was reviewed against the Nangate45 platform configuration.

The Nangate45 technology uses a multi-metal-layer power grid involving:

- Metal1
- Metal4
- Metal7

The standard-cell PDN strategy includes:

- VDD global connections
- VSS global connections
- Core voltage domain
- Metal1 follow-pin connections
- Metal4 power stripes
- Metal7 power stripes
- Inter-layer PDN connections

The final OpenROAD implementation confirmed that the VDD and VSS networks were connected.

---

## Floorplanning

OpenROAD generated the core region and standard-cell placement rows for the SPI Master.

The configured physical-design parameters were used to establish the initial floorplan before placement.

The resulting design area was approximately:

    1376.28 µm²

The floorplan provided sufficient space for the standard cells and subsequent timing-repair cells introduced during CTS.

---

## Placement

The SPI Master successfully completed placement and detailed placement legalization.

The CTS checkpoint reported:

    Core area:              1376.28 µm²

    Movable instance area:   345.53 µm²

    Fixed instance area:      13.83 µm²

    Utilization:              26.1%

Placement legalization completed without illegal cells or illegal placement sites.

The placement analysis reported:

    Original HPWL:       952.6 µm

    Legalized HPWL:     1210.9 µm

    HPWL increase:          27%

The resulting placement database was successfully used for CTS.

---

## Clock Tree Synthesis

The design contains one primary clock:

    clk

OpenROAD identified:

    24 clock sinks

TritonCTS generated the clock tree using:

    CLKBUF_X3

The clock tree generation produced:

    3 clock buffers

The resulting clock tree had:

    Minimum path depth: 2

    Maximum path depth: 2

The clock-tree synthesis itself completed successfully.

---

## CTS Timing Repair

Before hold repair:

    Setup violations: 0

    Hold endpoints:   24

OpenROAD performed timing repair and inserted hold buffers.

The repair process increased the number of physical cells but successfully removed the reported hold violations.

Final timing-repair results were approximately:

    Hold WNS: +0.004 ns

    Hold TNS: 0.000 ns

No setup violations were reported.

The automated ORFS CTS target initially terminated with:

    child killed: illegal instruction

The CTS operations were then isolated and reproduced manually using the OpenROAD executable inside the Docker environment.

The manual CTS flow completed successfully and generated the required checkpoint:

    4_1_cts.odb

    4_cts.sdc

This checkpoint was then used to continue the remaining physical-design stages.

---

## Global Routing

The SPI Master successfully completed global routing.

The resulting checkpoint was:

    5_1_grt.odb

The corresponding timing constraint database was:

    5_1_grt.sdc

The global-routing checkpoint was verified before proceeding to detailed routing.

---

## Detailed Routing

Detailed routing completed successfully.

The final routed database generated by the routing stage was:

    5_2_route.odb

A routing guide was also generated:

    route.guide

The routed database was successfully used by the final physical-design stages.

---

## Filler Cell Insertion

Filler cells were inserted after routing.

The flow reported:

    427 filler instances

The filler-cell stage generated:

    5_3_fillcell.odb

The filler cells provide the required standard-cell row continuity for the final physical implementation.

---

## Density Fill

The density-fill stage was executed successfully.

The resulting database was:

    6_1_fill.odb

The final report then processed this database for physical signoff.

---

## RC Extraction

The final signoff stage performed parasitic extraction.

The extraction process reported:

    559 RC segments

    830 RC segments

    830 capacitances

    1152 coupling capacitances

The extracted parasitic information was used during final physical analysis.

---

## IR-Drop Analysis

The final OpenROAD power-integrity analysis confirmed that the VDD and VSS networks were connected.

### VDD

    Supply voltage:       1.10 V

    Average IR drop:      0.000367 V

    Worst-case IR drop:   0.000617 V

    Percentage drop:      0.06%

### VSS

    Supply voltage:       0.00 V

    Average IR drop:      0.000434 V

    Worst-case IR drop:   0.000789 V

    Percentage drop:      0.07%

The final report confirmed:

    All shapes on net VDD are connected.

    All shapes on net VSS are connected.

---

## Final Physical Results

The final OpenROAD implementation reported:

| Metric | Result |
|--------|--------|
| Technology | Nangate45 |
| Design | SPI Master |
| Design area | 359 µm² |
| Utilization | 26% |
| Total cells | 719 |
| Fill cells | 427 |
| Tap cells | 52 |
| Clock buffers | 3 |
| Timing repair buffers | 107 |
| Inverters | 22 |
| Clock inverter | 1 |
| Sequential cells | 24 |
| Multi-input combinational cells | 83 |

The final design area reported by the signoff stage was:

    359 µm²

with:

    26% utilization

---

## Final ASIC Artifacts

The final physical implementation successfully generated:

    6_final.odb

    6_final.def

    6_final.gds

    6_final.sdc

The files are located under:

    layout/orfs_results/nangate45/spi_master/base/

The final GDSII file was generated through the KLayout-based stream-out process.

KLayout reported:

    All LEF cells have matching GDS/OAS cells

    No orphan cells in the final layout

This confirms successful LEF-to-GDS cell mapping during final layout export.

---

## Project Structure

    Project05_SPI_Master/
    │
    ├── rtl/
    │   ├── spi_bit_counter.v
    │   ├── spi_clock_generator.v
    │   ├── spi_master.v
    │   ├── spi_master_fsm.v
    │   └── spi_shift_register.v
    │
    ├── constraints/
    │   └── spi_master.sdc
    │
    ├── yosys/
    │   ├── netlists/
    │   │   └── spi_master_netlist.v
    │   ├── schematics/
    │   │   └── spi_master.svg
    │   └── synth_spi_master.ys
    │
    ├── openroad/
    │   └── spi_master/
    │       ├── config.mk
    │       └── pdn.tcl
    │
    └── layout/
        └── orfs_results/
            └── nangate45/
                └── spi_master/
                    └── base/
                        ├── 4_1_cts.odb
                        ├── 4_cts.sdc
                        ├── 5_1_grt.odb
                        ├── 5_1_grt.sdc
                        ├── 5_2_route.odb
                        ├── 5_3_fillcell.odb
                        ├── 6_1_fill.odb
                        ├── 6_final.odb
                        ├── 6_final.def
                        ├── 6_final.gds
                        └── 6_final.sdc

---

## Key Learning Outcomes

This project provided practical experience with:

- SPI Master architecture
- FSM-based control
- Serial data transmission
- Serial data reception
- Shift-register design
- Programmable clock generation
- Bit counting
- RTL verification
- Reuse of synthesized netlists
- ASIC floorplanning
- Power-distribution-network concepts
- Standard-cell placement
- Clock Tree Synthesis
- Hold timing repair
- Global routing
- Detailed routing
- Filler-cell insertion
- Density fill
- RC extraction
- IR-drop analysis
- ODB generation
- DEF generation
- GDSII generation
- Docker-based ASIC implementation
- Practical OpenROAD debugging

---

## Important Engineering Lessons

### Reuse Existing Synthesis Results

The Yosys synthesis stage had already been completed in the Verilog portfolio.

Rather than repeating synthesis, the existing synthesized netlist and schematic were reused for the ASIC flow.

This keeps the project workflow modular:

    RTL Development
          ↓
    Yosys Synthesis
          ↓
    ASIC Physical Implementation

---


### CTS Can Introduce Significant Additional Cells

The initial placement contained fewer cells than the final implementation.

Clock Tree Synthesis and timing repair introduced additional physical cells, particularly hold-repair buffers.

The final design therefore contains:

    3 clock buffers

    107 timing-repair buffers

This demonstrates that timing closure can significantly affect physical implementation.

---

### Automated Flows Can Fail Even When the Design Stage Is Valid

The automated CTS flow terminated with an illegal-instruction error after successfully completing:

- Clock-tree generation
- Timing repair
- Detailed placement
- Placement legalization

The CTS stage was therefore isolated and executed manually using the OpenROAD executable inside the Docker environment.

The manual flow completed successfully and produced the required CTS checkpoint.

This demonstrates an important practical EDA lesson:

    Tool failure does not necessarily mean design failure.

Understanding the flow stages and intermediate databases is essential for debugging real ASIC implementation environments.

---

### Physical Implementation Is Highly Interdependent

Each physical-design stage depends on the correctness of the previous checkpoint.

The SPI Master flow demonstrated the dependency:

    Placement
       ↓
    CTS
       ↓
    Global Routing
       ↓
    Detailed Routing
       ↓
    Filler / Density Fill
       ↓
    Extraction
       ↓
    Signoff
       ↓
    GDSII

Maintaining correct database paths and checkpoint files is therefore critical when running individual OpenROAD stages.

---

## Project Significance

Project 05 represents the next step in the ASIC portfolio after the utility-IP physical implementation work.

The project takes a practical communication controller and demonstrates how an existing synthesized RTL IP block can be transformed into a physically implemented ASIC design.

The workflow now covers:

    RTL Design

        ↓

    RTL Simulation

        ↓

    Yosys Synthesis

        ↓

    Gate-Level Netlist

        ↓

    OpenROAD Physical Design

        ↓

    Timing Closure

        ↓

    Routing

        ↓

    Parasitic Extraction

        ↓

    Power Integrity Analysis

        ↓

    Final GDSII

---

## Portfolio Position

Project 05 strengthens the transition from basic RTL design toward reusable ASIC IP development.

The SPI Master introduces a more realistic communication-oriented hardware block while also reinforcing the complete ASIC physical-design flow.

The experience gained from this project will be reused for increasingly complex designs involving:

- Communication controllers
- Reusable RTL IP
- Bus interfaces
- Memory controllers
- SoC peripherals
- Larger hierarchical designs
- RISC-V-based systems

---

## Conclusion

Project 05 successfully demonstrates the implementation of an SPI Master from existing synthesized RTL through complete ASIC physical implementation.

The design successfully progressed through:

**Synthesis artifact reuse → Floorplanning → Placement → Clock Tree Synthesis → Timing Repair → Global Routing → Detailed Routing → Filler Insertion → Density Fill → RC Extraction → IR-Drop Analysis → Final GDSII**

The final implementation generated valid ODB, DEF, SDC, and GDSII artifacts using the Nangate45 technology platform.

The project also provided practical experience debugging an OpenROAD CTS failure by isolating the failing stage and manually generating the required physical-design checkpoint.

This project therefore establishes a stronger foundation for moving from individual RTL modules toward larger ASIC IP blocks, SoC peripherals, and eventually complete open-source silicon implementations.