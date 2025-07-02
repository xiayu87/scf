Smart Cat‑Feeder SoC Specification (v0.1)

1. Purpose & Use‑Case
Autonomous cat‑feeder that uses vision and AI to detect a cat’s mood (playful, hungry, anxious) and dispenses food accordingly, creating a reward‑based learning loop.

2. Functional Requirements
| ID   | Feature                             | Description                                                                     |
|------|-------------------------------------|---------------------------------------------------------------------------------|
| REQ1 | Vision Input                        | MIPI‑CSI camera, 10 fps @ 320×240                                               |
| REQ2 | AI Inference                        | On‑chip CNN accelerator for mood classification, ≤100 ms latency                |
| REQ3 | Dispenser Control                   | PWM‑driven servo motor control for food portioning                              |
| REQ4 | Reward Sensing                      | Load cell measurement to detect food removal                                    |
| REQ5 | Feedback Output                     | Audio (PWM/DAC) and RGB LED indicators                                          |
| REQ6 | Storage                             | 1–2 MB SPI‑flash for model weights and logs                                     |

3. Performance & Resource Targets
- Inference Rate: ≥10 fps
- Control Loop Latency: ≤100 ms end‑to‑end
- Power Budget: ≤500 mW active
- On‑Chip SRAM: 64 kB activations + 32 kB weights
- Clock Frequency: 50 MHz (FPGA), up to 100 MHz (ASIC)

4. Interfaces & Protocols
- Bus: AMBA AXI4‑Full for accelerator & memory<br>AMBA AXI4‑Lite for peripherals
- Camera: MIPI‑CSI or parallel CMOS interface
- Flash: SPI
- Servo: PWM signal
- Audio/LED: PWM or I²S for audio, GPIO for LED

5. Software & ML Workflow
- CPU Core: RV32IMC (FreeRTOS) or RV64GC (Linux)
- ML Runtime: TinyML inference + online update (bandit/online SGD)
- Reward Loop: Weight drop >X g -> positive reward; no removal -> negative

6. Modularity & Extensibility
- All peripherals behind AXI4‑Lite for plug‑and‑play addition/removal
- Parameterized bus interconnect via build‑time flags

Specs: Jul 7, 2025
