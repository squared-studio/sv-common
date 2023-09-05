# SystemVerilog RTL Design & Verification

---
## Directory structure
This section describes the purpose of individual folders in this repository

- **include** : This folder should contains all the files that can be called using `include` with the exception of some include files specific to a TB. The include file here may or may not be a part of RTL. All files here are expected to be inside a folder signifying their protocol or use case. 

- **intf** : This folder contains SystemVerilog interface. The interfaces must have their own driving and monitoring tasks. We recommended interfaces for verification purposes only, not for RTL design. We prefer having request and response structured IOs to speedup connections rather than using interface.

- **rtl** : All the synthesizable RTLs are to be kept with in this folder. Please located them inside proper sub-directories as needed. For example, let's say we have `var_fifo.sv`. This is a buffer module and and also falls with-in the fifo catagory. That's why, it's placed in `rtl/buffers/fifo/var_fifo.sv`

- **sub** : Contains all submodules. Submodule files are not automatically called for compilation. The need to be added manually in compile order within the `vivado_stimulate_extra_command_line_options` for each TB. This file is automatically generated beside the TB top file.

- **tb** : Contains all the TestBench (TB). The TBs are to be in same directory stucture as the top RTL under testing. In addition, each TB has to be inside a separate directory matching the name with the top module. For example, we are creating a TB for `fifo` located at `rtl/buffers/fifo/fifo.sv`. The TB's name should be the RTL name followed with `_tb`. Therefore, the TB's name in this case is `fifo_tb`. Similar to the RTL's location, the TB should also be located at `tb/buffers/fifo/fifo_tb/fifo_tb.sv`. Upon running simulation, if `vivado_*_extra_command_line_options` files don't exist, they will be created there.
---
## Simulation
In order to run simulation, the TB must be placed inside a sub-directory in the `tb` folder.\
For example, we want to simulate `fifo_tb.sv` located at `tb/buffers/fifo/fifo_tb/fifo_tb.sv`.\
Therefore, we only need to run the following command:
```
make simulate TOP=fifo_tb
```



## RTL
[Binary to Gray Code Converter](./docs/rtl/bin_to_gray.md)<br>
[](./docs/rtl/clk_gate.md)<br>
[Gray to Binary Code Converter](./docs/rtl/gray_to_bin.md)<br>
[Phase Lock Loop (PLL)](./docs/rtl/pll.md)<br>

