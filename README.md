# Open-Source ASIC Physical Design Projects

Hands-on ASIC physical design projects focused on taking synthesizable digital designs through an open-source RTL-to-GDS implementation flow.

The repository focuses on physical implementation using OpenROAD Flow Scripts (ORFS), with the Nangate45 standard-cell technology used for practical experimentation with modern ASIC design stages.

## Repository Scope

This repository is dedicated to learning and implementing the ASIC physical design flow.

The main workflow includes:

RTL Design
→ Logic Synthesis
→ Timing Constraints
→ Floorplanning
→ Power Distribution Network
→ Placement
→ Clock Tree Synthesis
→ Routing
→ Parasitic Extraction
→ Physical Analysis
→ GDSII Generation

The RTL and synthesis work is maintained separately in the Verilog RTL portfolio. This repository focuses on the physical implementation side of the design flow.

## Projects

| Project | Design | Main Focus |
|---|---|---|
| Project 01 | 4-bit ALU | Combinational ASIC physical implementation |
| Project 02 | 4-bit Binary Counter | Sequential ASIC physical implementation |
| Project 03 | UART TX/RX FSM | Communication-oriented RTL and complete ASIC physical implementation |

## Project 01 — 4-bit ALU

A small combinational ALU used as the first physical-design implementation project.

The design provides practical experience with taking combinational RTL into an ASIC implementation flow.

### Physical Design Focus

- RTL integration
- Timing constraints
- Floorplanning
- Power distribution network
- Standard-cell placement
- Clock-related implementation flow
- Routing
- Physical verification
- GDSII generation

### Main Files

- rtl/alu_4bit.v
- constraints/alu_4bit.sdc
- openroad/config.mk
- openroad/pdn.tcl

## Project 02 — 4-bit Binary Counter

A sequential 4-bit binary counter used to introduce clocked logic into the ASIC physical design workflow.

The project builds on the previous combinational implementation and introduces sequential cells and clock-tree-related physical implementation.

### Physical Design Focus

- Sequential standard cells
- Clocked RTL implementation
- Timing constraints
- Floorplanning
- Power distribution
- Placement
- Clock Tree Synthesis
- Routing
- Parasitic extraction
- IR-drop analysis
- Final physical database and GDSII generation

### Main Files

- rtl/binary_counter_4bit.v
- constraints/binary_counter_4bit.sdc
- openroad/config.mk
- openroad/pdn.tcl

## Project 03 — UART FSM

A UART transmitter and receiver implemented using finite-state machines.

The project expands the portfolio from basic arithmetic and sequential logic into a communication-oriented digital subsystem.

The RTL contains separate transmitter and receiver FSMs with dedicated timing constraints and independent OpenROAD physical-design configurations.

Both UART TX and UART RX were taken through the ASIC physical implementation flow and successfully generated final physical-design artifacts.

### UART Transmitter

The UART transmitter implements a finite-state machine consisting of:

IDLE
→ START
→ DATA
→ STOP
→ IDLE

The transmitter accepts an 8-bit parallel input and serializes the data onto the UART TX output.

### UART Receiver

The UART receiver implements a finite-state machine consisting of:

IDLE
→ START
→ DATA
→ STOP
→ DONE
→ IDLE

The receiver samples the serial RX input and reconstructs the received 8-bit data word.

### Physical Design Focus

- UART transmitter FSM
- UART receiver FSM
- Timing constraints
- OpenROAD configuration
- Power-grid configuration
- Floorplanning
- Standard-cell placement
- Clock Tree Synthesis
- Global routing
- Detailed routing
- Routing DRC analysis
- Parasitic extraction
- IR-drop analysis
- Final physical database generation
- GDSII generation

### Main Files

- rtl/uart_tx_fsm.v
- rtl/uart_rx_fsm.v
- constraints/uart_tx_fsm.sdc
- constraints/uart_rx_fsm.sdc
- openroad/uart_tx/config.mk
- openroad/uart_tx/pdn.tcl
- openroad/uart_rx/config.mk
- openroad/uart_rx/pdn.tcl
- yosys/synth_uart_tx_fsm.ys
- yosys/synth_uart_rx_fsm.ys

### UART TX Physical Implementation

The UART transmitter successfully completed the OpenROAD physical-design flow and generated final physical-design artifacts.

Final artifacts include:

- 6_final.def
- 6_final.gds
- 6_final.odb
- 6_final.spef
- 6_final.v

These artifacts represent the final routed and extracted implementation.

### UART RX Physical Implementation

The UART receiver successfully completed the OpenROAD physical-design flow through final GDSII generation.

The flow successfully completed:

- Logic synthesis
- Floorplanning
- Tapcell insertion
- Power distribution network generation
- Global placement
- Detailed placement
- Clock Tree Synthesis
- Global routing
- Detailed routing
- Filler insertion
- RC extraction
- IR analysis
- Final physical database generation
- GDSII generation

### UART RX CTS Runtime Workaround

During the UART RX implementation, OpenROAD encountered an `illegal instruction` during the post-CTS timing-repair operation.

The failure occurred after Clock Tree Synthesis had completed successfully and after setup and hold analysis reported no violations.

The RX OpenROAD configuration therefore uses:

export SKIP_CTS_REPAIR_TIMING = 1

This bypasses the problematic post-CTS timing-repair step while allowing the remaining physical-design flow to continue.

The RX implementation subsequently completed successfully through routing, filler insertion, RC extraction, IR analysis, and final GDSII generation.

The workaround is intentionally documented so that the implementation flow remains transparent and reproducible.

### UART RX Routing Results

During detailed routing, the router initially reported routing violations.

The routing optimization process resolved the reported violations.

Final routing result:

Number of violations = 0

Additional routing statistics included:

Total wire length = 811 um
Total number of vias = 641

### UART RX Physical Metrics

The final physical implementation reported approximately:

Design area = 238 um²
Utilization = 21%

The final implementation included sequential cells, combinational cells, clock buffers, filler cells, tap cells, and timing-repair cells.

### UART RX RC Extraction

The final routed design was processed through RC extraction.

The extraction completed successfully and generated:

6_final.spef

The extracted parasitic data includes resistance, capacitance, and coupling-capacitance information for the routed interconnect.

### UART RX Power Integrity

The final implementation also included power-grid analysis for the VDD and VSS networks.

The reported worst-case IR-drop values were approximately:

VDD worst-case IR drop = 0.000146 V
VSS worst-case IR drop = 0.000162 V

The reported percentage drop was approximately:

0.01%

The final analysis also confirmed connectivity of the VDD and VSS power networks.

### UART RX Final GDSII

The physical implementation generated the final GDSII layout:

6_final.gds

The final physical-design artifacts include:

- 6_final.gds
- 6_final.odb
- 6_final.def
- 6_final.spef
- 6_final.v
- 6_final.sdc

The GDS merge stage completed successfully with the required standard-cell layout data.

## ASIC Physical Design Flow

The projects are developed around the following implementation stages.

### 1. RTL

The starting point is synthesizable Verilog RTL describing the digital functionality.

### 2. Logic Synthesis

The RTL is converted into a gate-level representation using standard-cell technology.

### 3. Timing Constraints

SDC constraints define clock behavior and input/output timing requirements.

Typical constraints include:

- Clock period
- Input delay
- Output delay
- Reset timing exceptions

### 4. Floorplanning

The physical design area and core dimensions are established.

The floorplan determines the physical region in which standard cells and other design structures are implemented.

### 5. Power Distribution Network

The PDN provides power and ground connectivity throughout the standard-cell region.

The Nangate45 platform configuration uses multiple metal layers for power distribution and connects the standard-cell power rails to the upper-level power network.

### 6. Placement

Standard cells are physically positioned inside the core area while considering timing, congestion, and design utilization.

### 7. Clock Tree Synthesis

Clock Tree Synthesis distributes the clock signal to sequential elements while controlling skew and buffering.

This stage is particularly important for sequential designs such as the binary counter and UART FSMs.

### 8. Routing

Signal connections are routed through the available metal layers and vias.

Global routing establishes routing paths while detailed routing creates the final physical interconnect geometry.

### 9. Parasitic Extraction

Physical interconnect resistance and capacitance are extracted from the routed design.

These parasitic effects are important for realistic timing and physical analysis.

### 10. Physical Analysis

The implemented design is analyzed for physical characteristics such as:

- Timing
- Area
- Utilization
- Routing
- Power connectivity
- IR drop
- Design-rule-related issues

### 11. GDSII

The final physical database can be converted into GDSII layout data representing the chip geometry.

## Technology

The current physical implementation experiments use:

- Technology: Nangate45
- Standard-cell library: NangateOpenCellLibrary
- Physical design flow: OpenROAD Flow Scripts
- Layout database: OpenROAD ODB
- Layout exchange: DEF
- Final layout format: GDSII
- Timing constraints: SDC

## Tools

### OpenROAD

Used for ASIC physical implementation including:

- Floorplanning
- PDN generation
- Placement
- Clock Tree Synthesis
- Routing
- Parasitic extraction
- Timing and physical analysis
- GDSII generation

### OpenROAD Flow Scripts

ORFS provides the structured implementation flow used to automate the physical-design stages.

### Nangate45

An open standard-cell technology used for learning and experimentation with ASIC physical implementation.

### Docker

The OpenROAD environment is executed through Docker to provide a reproducible Linux-based EDA environment.

## Repository Structure

    ASIC_Tools/
    ├── Project01_ALU/
    │   ├── constraints/
    │   ├── openroad/
    │   └── rtl/
    │
    ├── Project02_Sequential/
    │   ├── constraints/
    │   ├── openroad/
    │   ├── rtl/
    │   └── README.md
    │
    ├── Project03_UART/
    │   ├── constraints/
    │   ├── layout/
    │   ├── openroad/
    │   │   ├── uart_tx/
    │   │   └── uart_rx/
    │   ├── rtl/
    │   └── yosys/
    │
    ├── .gitignore
    └── README.md

Generated physical-design databases, temporary files, and large OpenROAD output directories are intentionally excluded from the repository where appropriate.

## Engineering Approach

The goal of this repository is not simply to run an automated ASIC flow.

Each project is used to understand what happens at every stage of physical implementation and how RTL decisions influence the final physical design.

The workflow therefore emphasizes:

- Understanding tool commands
- Understanding why each command is used
- Reading generated reports
- Inspecting physical databases
- Understanding timing constraints
- Understanding placement and routing
- Studying power distribution
- Investigating physical-design errors
- Debugging EDA tool issues
- Comparing implementation results
- Building reproducible project configurations

The learning process focuses on gradually developing practical knowledge of the complete ASIC implementation flow rather than memorizing commands without understanding their purpose.

## Learning Progression

The projects progressively increase in complexity.

Project 01 establishes the basic ASIC physical implementation workflow using combinational logic.

Project 02 introduces sequential logic, clocked cells, clock-tree considerations, parasitic extraction, and power-related analysis.

Project 03 expands the design scope toward communication-oriented RTL and demonstrates the complete physical implementation of both UART transmitter and receiver blocks.

Future projects will progressively move toward larger RTL blocks, reusable IP, more complex timing behavior, advanced physical constraints, larger communication systems, processor-oriented designs, and eventually SoC-level physical design concepts.

## Current Status

| Project | RTL | Constraints | OpenROAD Setup | Physical Implementation |
|---|---|---|---|---|
| Project 01 | Complete | Complete | Complete | Complete |
| Project 02 | Complete | Complete | Complete | Complete |
| Project 03 | Complete | Complete | Complete | Complete |

## Portfolio Objective

This repository is part of a broader hardware-design portfolio covering:

- Digital logic design
- Verilog RTL
- Functional verification
- Logic synthesis
- FPGA-oriented design
- ASIC physical design
- Open-source EDA
- RISC-V architecture
- Hardware acceleration
- Edge AI hardware

The long-term objective is to progress from RTL-level digital design toward complete hardware implementation and eventually system-level SoC and AI-hardware architecture.

## Author

Omm Prakash Sahoo

Built as a hands-on engineering portfolio for learning and demonstrating open-source ASIC physical design.