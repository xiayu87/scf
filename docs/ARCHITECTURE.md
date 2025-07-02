flowchart LR
    CPU[RISC-V CPU Core]
    ACC[AI Accelerator]
    AXI[AXI4 Interconnect]
    SRAM[On-Chip SRAM]
    FLASH[SPI Flash]
    CAM[Camera Interface]
    SERVO[Servo Controller]
    AUDIO[Audio DAC & PWM]
    LED[RGB LED Driver]

    CPU --> AXI
    ACC --> AXI
    SRAM --> AXI
    FLASH --> CPU
    FLASH --> AXI
    CAM --> CPU
    CAM --> ACC
    CPU --> SERVO
    CPU --> AUDIO
    CPU --> LED
    
    AXI --> externalDDR[(External DRAM)]
