////////////////////////////////////////////////////////////////////////////////////////////////////
//
//    AUTHOR      : Khadija Yeasmin Fariya
//    EMAIL       : fariya.khadijayeasmin@gmail.com
//
//    MODULE      : bin_to_gray_tb
//    DESCRIPTION : Binary to Gray Converter Testbench
//
////////////////////////////////////////////////////////////////////////////////////////////////////

module bin_to_gray_tb;

  //////////////////////////////////////////////////////////////////////////////////////////////////
  // IMPORTS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  `include "tb_essentials.sv"

  //////////////////////////////////////////////////////////////////////////////////////////////////
  // LOCALPARAMS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  localparam int DataWidth = 4;

  //////////////////////////////////////////////////////////////////////////////////////////////////
  // TYPEDEFS
  //////////////////////////////////////////////////////////////////////////////////////////////////



  //////////////////////////////////////////////////////////////////////////////////////////////////
  // SIGNALS
  //////////////////////////////////////////////////////////////////////////////////////////////////
  `CREATE_CLK(clk_i, 3, 7)

  bit arst_n = 1;

  logic [DataWidth-1:0] data_in_i;
  logic [DataWidth-1:0] data_out_o;

  //////////////////////////////////////////////////////////////////////////////////////////////////
  // INTERFACES
  //////////////////////////////////////////////////////////////////////////////////////////////////



  //////////////////////////////////////////////////////////////////////////////////////////////////
  // CLASSES
  //////////////////////////////////////////////////////////////////////////////////////////////////



  //////////////////////////////////////////////////////////////////////////////////////////////////
  // ASSIGNMENTS
  //////////////////////////////////////////////////////////////////////////////////////////////////



  //////////////////////////////////////////////////////////////////////////////////////////////////
  // RTLS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  bin_to_gray #(
      .DataWidth(DataWidth)
  ) bin_to_gray_dut (
      .data_in_i (data_in_i),
      .data_out_o(data_out_o)
  );

  //////////////////////////////////////////////////////////////////////////////////////////////////
  // METHODS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  task static apply_reset();
    #100;
    arst_n = 0;
    #100;
    arst_n = 1;
    #100;
  endtask

  //////////////////////////////////////////////////////////////////////////////////////////////////
  // PROCEDURALS
  //////////////////////////////////////////////////////////////////////////////////////////////////

  initial begin
    apply_reset();
    data_in_i = 4'b0000;
  end

  always @* begin
    for (int i = 0; i < 16; i++) begin
      data_in_i = i;
      #1;
      // Check op
      case (i)
        4'h0:
        assert (data_out_o == 4'h0)
        else $display("Error at input 0");
        4'h1:
        assert (data_out_o == 4'h1)
        else $display("Error at input 1");
        4'h2:
        assert (data_out_o == 4'h3)
        else $display("Error at input 2");
        4'h3:
        assert (data_out_o == 4'h2)
        else $display("Error at input 3");
        4'h4:
        assert (data_out_o == 4'h6)
        else $display("Error at input 4");
        4'h5:
        assert (data_out_o == 4'h7)
        else $display("Error at input 5");
        4'h6:
        assert (data_out_o == 4'h5)
        else $display("Error at input 6");
        4'h7:
        assert (data_out_o == 4'h4)
        else $display("Error at input 7");
        4'h8:
        assert (data_out_o == 4'hC)
        else $display("Error at input 8");
        4'h9:
        assert (data_out_o == 4'hD)
        else $display("Error at input 9");
        4'hA:
        assert (data_out_o == 4'hF)
        else $display("Error at input A");
        4'hB:
        assert (data_out_o == 4'hE)
        else $display("Error at input B");
        4'hC:
        assert (data_out_o == 4'hA)
        else $display("Error at input C");
        4'hD:
        assert (data_out_o == 4'hB)
        else $display("Error at input D");
        4'hE:
        assert (data_out_o == 4'h9)
        else $display("Error at input E");
        4'hF:
        assert (data_out_o == 4'h8)
        else $display("Error at input F");
        default: $display("Error at input value: %0d", i);
      endcase
    end
    #100;
    $finish;
  end
endmodule