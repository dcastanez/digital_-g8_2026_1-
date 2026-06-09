module MULT(clk, init, rst, A, B, R, done);
  input clk;
  input init;
  input rst;
  input [15:0] A;
  input [15:0] B;
  output [31:0] R;
  output done;

  wire w_rs;
  wire w_sh;
  wire w_ad;

  wire [31:0] w_A;
  wire [15:0] w_B;
  wire w_z;

  rsr rsr0 (.clk(clk), .rs(w_rs), .sh(w_sh), .i_B(B),
            .o_B(w_B));
  rsl rsl0 (.clk(clk), .rs(w_rs), .sh(w_sh), .i_A(A),
            .o_A(w_A));
  comp comp0 (.B(w_B),
              .z(w_z));
  acc acc0 (.clk(clk), .rs(w_rs), .ad(w_ad), .A(w_A),
            .r(R));
  control_MULT control_MULT0 (.clk(clk), .rst(rst), .init(init), .B(w_B[0]), .z(w_z),
                              .rs(w_rs), .sh(w_sh), .ad(w_ad), .done(done));
endmodule
