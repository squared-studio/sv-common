# SystemVerilog RTL Design & Verification

## Directory structure
This section describes the purpose of individual folders in this repository

- **include** : This folder should contains all the files that can be called using `include` with the exception of some include files specific to a TB. The include file here may or may not be a part of RTL. All files here are expected to be inside a folder signifying their protocol or use case. 

- **intf** : This folder contains SystemVerilog interface. The interfaces must have their own driving and monitoring tasks. We recommended interfaces for verification purposes only, not for RTL design. We prefer having request and response structured IOs to speedup connections rather than using interface.

- **rtl** : All the synthesizable RTLs are to be kept with in this folder. Please located them inside proper sub-directories as needed. For example, let's say we have `var_fifo.sv`. This is a buffer module and and also falls with-in the fifo catagory. That's why, it's placed in `rtl/buffers/fifo/var_fifo.sv`

- **sub** : Contains all submodules. Submodule files are not automatically called for compilation. The need to be added manually in compile order within the `vivado_stimulate_extra_command_line_options` for each TB. This file is automatically generated beside the TB top file.

- **tb** : Contains all the TestBench (TB). The TBs are to be in same directory stucture as the top RTL under testing. In addition, each TB has to be inside a separate directory matching the name with the top module. For example, we are creating a TB for `fifo` located at `rtl/buffers/fifo/fifo.sv`. The TB's name should be the RTL name followed with `_tb`. Therefore, the TB's name in this case is `fifo_tb`. Similar to the RTL's location, the TB should also be located at `tb/buffers/fifo/fifo_tb/fifo_tb.sv`. Upon running simulation, if `vivado_*_extra_command_line_options` files don't exist, they will be created there.

## How-to
To know how to use different commands on this repo, type `make help` or just `make` at the repo root and further details with be printed on the terminal.
## RTL
[addr_decoder ](./docs/rtl/addr_decoder.md)<br>
[axi4l_gpio ](./docs/rtl/axi4l_gpio.md)<br>
[AXI4L](./docs/rtl/axi4l_gpio_des.md)<br>
[axi_fifo ](./docs/rtl/axi_fifo.md)<br>
[AXI](./docs/rtl/axi_fifo_des.md)<br>
[bin_to_gray ](./docs/rtl/bin_to_gray.md)<br>
[Binary](./docs/rtl/bin_to_gray_des.md)<br>
[cdc_fifo ](./docs/rtl/cdc_fifo.md)<br>
[circular_xbar ](./docs/rtl/circular_xbar.md)<br>
[clk_div ](./docs/rtl/clk_div.md)<br>
[clk_gate ](./docs/rtl/clk_gate.md)<br>
[clk_mux ](./docs/rtl/clk_mux.md)<br>
[counter ](./docs/rtl/counter.md)<br>
[decoder ](./docs/rtl/decoder.md)<br>
[demux ](./docs/rtl/demux.md)<br>
[dff ](./docs/rtl/dff.md)<br>
[dual_synchronizer ](./docs/rtl/dual_synchronizer.md)<br>
[edge_detector ](./docs/rtl/edge_detector.md)<br>
[encoder ](./docs/rtl/encoder.md)<br>
[fifo ](./docs/rtl/fifo.md)<br>
[fixed_priority_arbiter ](./docs/rtl/fixed_priority_arbiter.md)<br>
[freq_div ](./docs/rtl/freq_div.md)<br>
[gray_to_bin ](./docs/rtl/gray_to_bin.md)<br>
[Gray](./docs/rtl/gray_to_bin_des.md)<br>
[handshake_combiner ](./docs/rtl/handshake_combiner.md)<br>
[handshake_counter ](./docs/rtl/handshake_counter.md)<br>
[io_pad ](./docs/rtl/io_pad.md)<br>
[IO](./docs/rtl/io_pad_des.md)<br>
[jk_ff ](./docs/rtl/jk_ff.md)<br>
[latch ](./docs/rtl/latch.md)<br>
[mem ](./docs/rtl/mem.md)<br>
[mem_bank ](./docs/rtl/mem_bank.md)<br>
[mem_core ](./docs/rtl/mem_core.md)<br>
[mux ](./docs/rtl/mux.md)<br>
[mux_primitive ](./docs/rtl/mux_primitive.md)<br>
[pipeline ](./docs/rtl/pipeline.md)<br>
[pipeline_branch ](./docs/rtl/pipeline_branch.md)<br>
[pipeline_core ](./docs/rtl/pipeline_core.md)<br>
[pll_model ](./docs/rtl/pll_model.md)<br>
[Phase](./docs/rtl/pll_model_des.md)<br>
[priority_encoder ](./docs/rtl/priority_encoder.md)<br>
[register ](./docs/rtl/register.md)<br>
[register_dual_flop ](./docs/rtl/register_dual_flop.md)<br>
[reg_file ](./docs/rtl/reg_file.md)<br>
[round_robin_arbiter ](./docs/rtl/round_robin_arbiter.md)<br>
[rv_float_reg_file ](./docs/rtl/rv_float_reg_file.md)<br>
[rv_int_reg_file ](./docs/rtl/rv_int_reg_file.md)<br>
[rv_vec_reg_file ](./docs/rtl/rv_vec_reg_file.md)<br>
[shift_register ](./docs/rtl/shift_register.md)<br>
[sr_latch_arstn ](./docs/rtl/sr_latch_arstn.md)<br>
[uart_parity_checker ](./docs/rtl/uart_parity_checker.md)<br>
[var_fifo ](./docs/rtl/var_fifo.md)<br>
[xbar ](./docs/rtl/xbar.md)<br>

## INCLUDE
[axi4l_typedef.svh](./docs/include/axi4l_typedef.svh.md)<br>
[axi4_typedef.svh](./docs/include/axi4_typedef.svh.md)<br>
[vip/axi4l_pkg.sv](./docs/include/vip/axi4l_pkg.sv.md)<br>

