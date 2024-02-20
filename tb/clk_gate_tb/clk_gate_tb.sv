// Description here
// ### Author : Foez Ahmed (foez.official@gmail.com)

`include "vip/clocking.svh"

module clk_gate_tb;

  `define ENABLE_DUMPFILE

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-IMPORTS{{{
  //////////////////////////////////////////////////////////////////////////////////////////////////

  // bring in the testbench essentials functions and macros
  `include "vip/tb_ess.sv"

  //}}}

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-LOCALPARAMS{{{
  //////////////////////////////////////////////////////////////////////////////////////////////////



  //}}}

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-TYPEDEFS{{{
  //////////////////////////////////////////////////////////////////////////////////////////////////



  //}}}

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-SIGNALS{{{
  //////////////////////////////////////////////////////////////////////////////////////////////////

  // generates static task start_clk_i with tHigh:4ns tLow:6ns
  `CREATE_CLK(clk_i, 5ns, 5ns)

  logic arst_ni = 1;

  logic en_i = '0;
  logic clk_o;

  //}}}

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-VARIABLES{{{
  //////////////////////////////////////////////////////////////////////////////////////////////////



  //}}}

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-INTERFACES{{{
  //////////////////////////////////////////////////////////////////////////////////////////////////



  //}}}

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-CLASSES{{{
  //////////////////////////////////////////////////////////////////////////////////////////////////



  //}}}

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-ASSIGNMENTS{{{
  //////////////////////////////////////////////////////////////////////////////////////////////////



  //}}}

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-RTLS{{{
  //////////////////////////////////////////////////////////////////////////////////////////////////


  clk_gate #() u_clk_gate (
      .arst_ni(arst_ni),
      .clk_i(clk_i),
      .en_i(en_i),
      .clk_o(clk_o)
  );

  //}}}

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-METHODS{{{
  //////////////////////////////////////////////////////////////////////////////////////////////////

  task static apply_reset();
    #100ns;
    arst_ni <= 0;
    #100ns;
    arst_ni <= 1;
    #100ns;
  endtask

  task static rand_reset(realtime unit_time = 1ns, int unsigned min = 500, int unsigned max = 5000);
    fork
      forever begin
        #(unit_time * $urandom_range(min, max));
        arst_ni <= $urandom;
      end
    join_none
  endtask

  task static rand_en(realtime unit_time = 1ns, int unsigned min = 100, int unsigned max = 1000);
    fork
      forever begin
        #(unit_time * $urandom_range(min, max));
        en_i <= $urandom;
      end
    join_none
  endtask

  //}}}

  //////////////////////////////////////////////////////////////////////////////////////////////////
  //-PROCEDURALS{{{
  //////////////////////////////////////////////////////////////////////////////////////////////////

  `CLK_GLITCH_MON(arst_ni, clk_o, 5ns, 5ns)
  `CLK_GATE_MON(arst_ni, en_i, clk_i, clk_o)

  initial begin  // main initial{{{

    apply_reset();
    start_clk_i();
    rand_reset();
    rand_en();

    #10ms;

    $finish;

  end  //}}}

  //}}}

endmodule