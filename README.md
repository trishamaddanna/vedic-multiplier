# Design of Area-Efficient 16x16 Vedic Multiplier using Parallel Prefix Adder

A high-performance, area-efficient **16x16-bit hardware multiplier** architecture implemented in synthesizable Verilog HDL. This design incorporates the ancient Indian mathematical principles of the **Urdhva Tiryagbhyam sutra** alongside a high-speed **Ladner-Fischer Parallel Prefix Adder (PPA)** to dramatically compress critical path propagation delay, dynamic power consumption, and silicon area footprint.

## ⚡ Architectural Blueprint & Design Mechanics

### 1. Urdhva Tiryagbhyam Multiplication Core
The math processing logic performs vertical and crosswise multiplication, enabling simultaneous partial-product generation. 
*   The 16x16-bit block splits into an optimized structure composed of four parallel 8x8-bit sub-modules.
*   Each block evaluates internal bits concurrently, shifting structural carry generation away from sequential limits to lower calculation complexity.
  
Step 1: Vertical Step 2: Crosswise Step 3: Vertical
a1 a0 a1 a0 a1 a0
| | \ / | |
b1 b0 b1 b0 b1 b0

### 2. Ladner-Fischer Tree Network
To prevent standard Ripple Carry bottlenecking, a three-stage tree-structured parallel prefix adder updates intermediate values concurrently:

*   **Pre-Processing Stage:** Instantly samples input lines to evaluate isolated group conditions:
     𝑃𝑠[𝑖] = 𝐴[𝑖] + 𝐵[𝑖]                     (1)  
     𝐺𝑠[𝑖] = 𝐴[𝑖] · 𝐵[𝑖]                     (2) 
*   **Carry Generation Stage:** Resolves concurrent carry pathways through multi-level lookahead tree execution:
    𝐺𝑠[𝑖: 𝑗] = 𝐺𝑠[𝑖: 𝑘] + (𝑃𝑠[𝑖: 𝑗] . 𝐺𝑠[𝑖: 𝑗])  (3)
    𝑃𝑠[𝑖: 𝑗] = 𝑃𝑠[𝑖: 𝑗] . 𝑃𝑠[𝑖: 𝑘]              (4)  
*   **Post-Processing Stage:** Combines computed parallel prefix bits via localized gates to extract finalized product metrics:
    𝑆𝑢𝑚 = 𝐴 𝑋𝑂𝑅 𝐵 𝑋𝑂𝑅 𝐶[𝑖 − 1]              (5)  
    𝐶 [𝑖 − 1] = 𝐺𝑠 [𝑖1]                       (6)  

# Design of Area-Efficient 16x16 Vedic Multiplier using Parallel Prefix Adder
A high-performance, area-efficient **16x16-bit hardware multiplier** architecture implemented in synthesizable Verilog HDL. This design incorporates the ancient Indian mathematical principles of the **Urdhva Tiryagbhyam sutra** alongside a high-speed **Ladner-Fischer Parallel Prefix Adder (PPA)** to dramatically compress critical path propagation delay, dynamic power consumption, and silicon area footprint.

## 📊 Synthesis & Performance Verification Metrics

The complete architecture was modeled using Verilog HDL and verified utilizing **Xilinx 14.7** and **Cadence Design Tools**. Gate-level netlist mapping confirms significant efficiency gains over conventional architectures:

### 1. Chip Area & Power Breakdown (Cadence Genus)
Compared to a standard 16-bit Vedic multiplication block, this optimized parallel-prefix approach delivers massive hardware reduction:

| Parameter | Baseline Vedic Multiplier | This Architecture (Vedic + LF-PPA) | Total Reduction |
| :--- | :---: | :---: | :---: |
| **Silicon Net Area** | $4,646.037\ \mu\text{m}^2$ | **$1,108.974\ \mu\text{m}^2$** | **76.13% Area Savings** |
| **Total Power Consumption** | $0.300\text{ mW}$ | **$0.096\text{ mW}$ ($96.13\ \mu\text{W}$)** | **67.95% Power Savings** |
| **Total Gate Cell Count** | *Baseline Core* | **803 Cells** | **Highly Optimized Netlist** |

*   **Synthesis Power Profile Distribution (Cadence)**:
    *   *Leakage Power:* $10.38\ \mu\text{W}$ ($10.80\%$)
    *   *Internal Circuit Power:* $42.56\ \mu\text{W}$ ($44.27\%$)
    *   *Dynamic Switching Power:* $43.19\ \mu\text{W}$ ($44.93\%$)

### 2. FPGA Resource Allocation (Xilinx Spartan-6)
Physical implementation summary for the internal 16-bit Ladner-Fischer adder tree:
*   **Path Delay:** $13.822\text{ ns}$
*   **Number of Slices:** 23
*   **Number of 4-input LUTs:** 43
*   **Number of Bonded IOBs:** 50 ($35\%$ package utilization)

---
## 📂 Repository Layout & Project Artifacts

All structural hardware core files, sub-multiplier cells, modular testbenches, and toolchain evaluation reports are hosted directly within the root directory for direct access:

*   `vedic16x16ppa.v` — Top-level synthesizable 16x16-bit Vedic multiplier core.
*   `vedic8x8ppa.v` — 8x8-bit intermediate multiplier engine.
*   `vedic4x4ppa.v` — 4x4-bit sub-multiplier block.
*   `vedic_2_x_2.v` — 2x2-bit fundamental multiplication cell.
*   `input3_adder.v` — 16-bit Ladner-Fischer parallel-prefix lookahead tree network.
*   `input8b_adder.v` — 8-bit parallel lookahead adder module block.
*   `input4b_adder.v` — 4-bit parallel adder component cell.
*   `vedic16x16ppa_tb.v` — Exhaustive top-level system verification testbench.
*   `vedic8x8ppa_tb.v` — Modular simulation suite for intermediate 8x8 block verification.
*   `vedic4x4ppa_tb.v` — Modular simulation suite for 4x4 block verification.
*   `vedic16x16ppa_area.rpt` — Production toolchain cell area optimization analysis ($1,108.974\ \mu\text{m}^2$).
*   `vedic16x16ppa_power.rpt` — Detailed Cadence gate leakage and dynamic power dissipation breakdown ($96.13\ \mu\text{W}$).
*   `vedic16x16ppa_gates.rpt` — Explicit netlist standard cell instance report confirming exactly 803 logic gates.
*   `Area Report of 16-bit Ladner-Fischer.txt` — 16-bit parallel-prefix adder FPGA utilization data log.
*   `16x16blockdiagram.jpg` — Hierarchical multiplication algorithm routing blueprint.
*   `blockdiag.jpg` — Ladner-Fischer lookahead carry tree logic routing mapping diagram.
*   `rtl.jpg` — Synthesized technology netlist register-transfer gate mappings layout.
*   `synthesis.jpg` — Enterprise standard cell area hierarchy placement schematic model.
*   `waveform.jpg` — Functional timing waves validating data throughput and boundary handshakes.
*   `README.md` — Main architectural specification and portfolio landing page.
