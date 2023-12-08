// ### Basic tb for register_page
// ### Author : Razu Ahamed (en.razu.ahamed@gmail.com)

module register_page_tb;
   
  localparam int ELEM_WIDTH = 8;

  logic [ELEM_WIDTH-1:0] in;
  logic [          12:0] addr;
  logic                  clk_i;
  logic                  arst_ni;
  logic                  en_i;
  logic [ELEM_WIDTH-1:0] out;
  register_page #(
      .ELEM_WIDTH(ELEM_WIDTH)
  ) u_register_page(
    .in(in),
    .addr(addr),
    .clk_i(clk_i),
    .arst_ni(arst_ni),
    .en_i(en_i),
    .out(out)
  );
  task start_clock ();
  fork
    forever begin
      clk_i = 1; #5;
      clk_i = 0; #5;
    end
  join_none
endtask
task apply_reset ();
clk_i   = 1 ;
arst_ni = 1 ;

#50         ;
arst_ni = 0 ;
in      =0  ;
addr    =0  ;
en_i    =0  ;

#50        ;
arst_ni = 1;
#50        ;
endtask
initial 
begin
  $dumpfile("dump.vcd"); 
  $dumpvars;
end
int pass =0;
int fail =0; 
initial
begin
  apply_reset ();
  start_clock ();
  #150;
  for(int i=0;i<100;i++)
  begin
    in   <= $urandom;
    addr <= $urandom;
    en_i <= $urandom;
    repeat(2) @(posedge clk_i);
    if((en_i==1 & in==out) | (en_i==0 & out==0))
      pass++;
    else
      fail++;
    $display("write_data=%d, en=%d, read_data=%d,address =%0d",in,en_i,out,addr);
  end
  $display("pass=%0d and fail = %0d",pass,fail);
  $finish;
end
endmodule