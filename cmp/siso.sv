/* 
                       clk_i                            arst_n
                      ---↓--------------------------------------↓---
                     ¦                                              ¦
[DATA_WIDTH] data_in →                                              → [DATA_WIDTH] data_out
       data_in_valid →                     siso                     → data_out_valid
       data_in_ready ←                                              ← data_out_ready
                     ¦                                              ¦
                      ----------------------------------------------
*/

module siso #(
  parameter DATA_WIDTH = 8,
  parameter NUM_STAGES = 5
) (
  input  logic                  clk_i,
  input  logic                  arst_n,

  input  logic [DATA_WIDTH-1:0] data_in,
  input  logic                  data_in_valid,
  output logic                  data_in_ready,

  output logic [DATA_WIDTH-1:0] data_out,
  output logic                  data_out_valid,
  input  logic                  data_out_ready
);

  assign data_out_valid = data_in_valid;
  assign data_in_ready = data_out_ready;
  assign data_out = mem [NUM_STAGES-1];

  logic [DATA_WIDTH-1:0] mem [NUM_STAGES];

  always_ff @( posedge clk_i or negedge arst_n ) begin : main
    if (arst_n) begin
      if (data_in_valid & data_out_ready) begin
        mem [0] <= data_in;
        for (int i = 1; i < NUM_STAGES; i++) begin
          mem [i] <= mem [i-1];
        end
      end
    end
    else begin
      for (int i = 0; i < NUM_STAGES; i++) begin
        mem [i] <= '0;
      end
    end
  end

endmodule