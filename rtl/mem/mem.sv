// A simple memory block.
// ### Author : Foez Ahmed (foez.official@gmail.com)

module mem #(
    parameter int ELEM_WIDTH = 8,
    parameter int DEPTH   = 7
) (
    input logic clk_i,
    input logic arst_ni,

    input logic                        we_i,
    input logic [$clog2(DEPTH)-1:0] waddr_i,
    input logic [      ELEM_WIDTH-1:0] wdata_i,

    input  logic [$clog2(DEPTH)-1:0] raddr_i,
    output logic [      ELEM_WIDTH-1:0] rdata_o
);

  logic [DEPTH-1:0] demux_we;
  logic [DEPTH-1:0][ELEM_WIDTH-1:0] reg_mux_in;

  demux #(
      .ELEM_WIDTH(1),
      .NUM_ELEM  (DEPTH)
  ) u_demux (
      .s_i(waddr_i),
      .i_i(we_i),
      .o_o(demux_we)
  );

  for (genvar i = 0; i < DEPTH; i++) begin : g_reg_array
    register #(
        .ELEM_WIDTH(ELEM_WIDTH)
    ) register_dut (
        .clk_i  (clk_i),
        .arst_ni(arst_ni),
        .en_i   (demux_we[i]),
        .d_i    (wdata_i),
        .q_o    (reg_mux_in[i])
    );
  end

  mux #(
      .ELEM_WIDTH(ELEM_WIDTH),
      .NUM_ELEM  (DEPTH)
  ) u_mux (
      .s_i(raddr_i),
      .i_i(reg_mux_in),
      .o_o(rdata_o)
  );

endmodule