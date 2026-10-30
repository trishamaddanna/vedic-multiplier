# Design of Area-Efficient 16x16 Vedic Multiplier using Parallel Prefix Adder

A synthesizable **16×16-bit hardware multiplier** implemented in Verilog HDL using the**Urdhva Tiryagbhyam algorithm** for parallel partial-product generation and a **Ladner-Fischer Parallel Prefix Adder (PPA)** for accelerated carry computation. The hierarchical architecture combines modular multiplier blocks with parallel-prefix addition to optimize arithmetic performance, silicon area and power consumption.

## ⚡ Architectural Blueprint & Design Mechanics

### 1. Urdhva Tiryagbhyam Multiplication Core
The multiplication core uses the vertical and crosswise multiplication technique to generate partial products.
*   The 16×16-bit multiplier is hierarchically decomposed into four 8×8-bit sub-multiplier modules.
*   Each sub-module performs its multiplication operations using the Urdhva Tiryagbhyam algorithm, enabling parallel partial-product generation.
  
```text
  Step 1: Vertical (LSB)      Step 2: Crosswise         Step 3: Vertical (MSB)
       a1     a0                  a1     a0                  a1     a0

              |                     \   /                    |      
       b1     b0                  b1     b0                  b1     b0

```

### 2. Ladner-Fischer Tree Network
To reduce the carry-propagation delay associated with conventional Ripple Carry Adders, the design incorporates a three-stage Ladner-Fischer parallel-prefix architecture.

*   **Pre-Processing Stage:** Instantly samples input lines to evaluate isolated group conditions:
    $$P_s[i] = A[i] \oplus B[i]$$ ;
    $$G_s[i] = A[i] \cdot B[i]$$
*   **Carry Generation Stage:** Resolves concurrent carry pathways through multi-level lookahead tree execution:
    $$G_s[i:j] = G_s[i:k] + (P_s[i:j] \cdot G_s[i:j])$$ ;
    $$P_s[i:j] = P_s[i:j] \cdot P_s[i:k]$$ 
*   **Post-Processing Stage:** Combines computed parallel prefix bits via localized gates to extract finalized product metrics:
    $$\text{Sum} = A \oplus B \oplus C[i-1]$$ ;
    $$C[i-1] = G_s[i1]$$ 

## 📊 Synthesis & Performance Verification Metrics

The complete architecture was modeled using Verilog HDL and verified utilizing **Xilinx 14.7** and **Cadence Design Tools**. The following results summarize the reported FPGA implementation metrics.

### 1. Area & Power Analysis (Cadence Genus)
Compared to a reference 16-bit Vedic multiplication block, this optimized parallel-prefix approach delivers massive hardware reduction:

| Parameter | Baseline Vedic Multiplier | This Architecture (Vedic + LF-PPA) | Total Reduction |
| :--- | :---: | :---: | :---: |
| **Silicon Net Area** | $4,646.037\ \mu\text{m}^2$ | **$1,108.974\ \mu\text{m}^2$** | **76.13% Area Savings** |
| **Total Power Consumption** | $0.300\text{ mW}$ | **$0.096\text{ mW}$ ($96.13\ \mu\text{W}$)** | **67.95% Power Savings** |
| **Total Gate Cell Count** | *Baseline Core* | **803 Cells** | **Highly Optimized Netlist** |

*   **Synthesis Power Profile Distribution (Cadence)**:
    *   *Leakage Power:* $10.38\ \mu\text{W}$ ($10.80\%$)
    *   *Internal Circuit Power:* $42.56\ \mu\text{W}$ ($44.27\%$)
    *   *Dynamic Switching Power:* $43.19\ \mu\text{W}$ ($44.93\%$)

### 2. FPGA Implementation: Resource Utilization (Xilinx Spartan-6)
Physical implementation summary for the internal 16-bit Ladner-Fischer adder tree:
*   **Path Delay:** $13.822\text{ ns}$
*   **Number of Slices:** 23
*   **Number of 4-input LUTs:** 43
*   **Number of Bonded IOBs:** 50 ($35\%$ package utilization)

---

## 🛠️ Toolchain Infrastructure & Synthesis Environment

Conducted cross-toolchain synthesis and verification using industry-standard electronic design automation (EDA) tools to validate architectural savings:

*   **ASIC Logic Synthesis:** Used Cadence Genus for standard-cell synthesis and mapping. The optimized architecture achieved a reported **76.13% reduction in silicon area to 1,108.974 µm²** and a **67.95% reduction in total power to 96.13 µW** compared with the reference implementation.
*   **FPGA Implementation:** Used **Xilinx ISE 14.7** for FPGA design evaluation, targeting the **Xilinx Spartan-6 platform.**
*   **Functional Verification:** Used Verilog simulation testbenches and waveform analysis to evaluate the multiplier's functional behavior.

---

## 📂 Repository Layout & Project Artifacts

All structural hardware core files, sub-multiplier cells, modular testbenches, and toolchain evaluation reports are hosted directly within the root directory for direct access:

**RTL Design Files**: 
*   `vedic16x16ppa.v` — Top-level synthesizable 16x16-bit Vedic multiplier.
*   `vedic8x8ppa.v` — 8x8-bit intermediate multiplier module.
*   `vedic4x4ppa.v` — 4x4-bit sub-multiplier module.
*   `vedic_2_x_2.v` — 2x2-bit fundamental multiplication module.
*   `input3_adder.v` — 16-bit Ladner-Fischer parallel-prefix adder.
*   `input8b_adder.v` — 8-bit parallel adder module.
*   `input4b_adder.v` — 4-bit parallel adder module.

**Simulation Testbenches**:
*   `vedic16x16ppa_tb.v` — Top-level multiplier verification testbench.
*   `vedic8x8ppa_tb.v` — 8×8-bit multiplier verification testbench.
*   `vedic4x4ppa_tb.v` — 4×4-bit multiplier verification testbench.

**Synthesis Reports**:
*   `vedic16x16ppa_area.rpt` — Cadence Genus area report (1,108.974 µm²).
*   `vedic16x16ppa_power.rpt` — Cadence power report (96.13 µW).
*   `vedic16x16ppa_gates.rpt` — Standard-cell instance report (803 cells).

**Design & Implementation Artifacts**:
*   `Area Report of 16-bit Ladner-Fischer.jpg` — FPGA resource utilization report for the 16-bit adder.
*   `16x16blockdiagram.jpg` — Hierarchical multiplication architecture diagram.
*   `blockdiag.jpg` — Ladner-Fischer lookahead carry tree architecture.
*   `rtl.jpg` — RTL synthesis and technology mapping view.
*   `synthesis.jpg` — Synthesis hierarchy and cell mapping view.
*   `waveform.jpg` — Functional simulation waveforms.
*   `README.md` — Main architectural specification and portfolio landing page.

---

## 📜 Citation & Publication Details
This multiplier architecture and its performance evaluation are documented in the following publication:
*   Dr Vidyasaraswathi H N, **Trisha Maddanna**, Vaishnavi U, Vidhushi Agrawal, Saurabh Singh, *"Design of Area Efficient Vedic Multiplier using Parallel Prefix Adder,"* **Tuijin Jishu / Journal of Propulsion Technology**, Vol. 45, No. 4, 2024.

