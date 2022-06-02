# human-reaction-test-vhdl
Use an FPGA to code the logic for a human reaction time to the blinking of a light. This was Archie and Dakin myself coding a human reaction test with VHDL on Nexsys4. We had each other during development; good brainstorming sessions. Doughlas Agho joined only helped with docs.

When you press the start button, the system waits a random time between 2 and 15s, tunrs on an LED for 1s, and waits for you to press THE button before the LED goes off. The goal is to press the button as soon as you see the LED. Average time between LED turning on an you pressing the button expected to be 200 - 400 milliseconds.

This [video](demo/vhdl-demo.mp4) shows you the end result. Schematics [here](rtl_schematic.pdf). Test bench and simulations [here](./Schematics/). [Nexys-4-DDR-Master.xdc](./Nexys-4-DDR-Master.xdc) is the constraint file for the Nexys4 DDR.

## Architecture
![Block diagram](demo/components.jpg)

![State diagram](demo/state-diagram.jpg)

![Flow chart](demo/flow-chart.jpg).


