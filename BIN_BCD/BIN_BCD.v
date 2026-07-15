module BIN_BCD(
           input clk,
           input init,
           input rst,
           input [8:0]B,
           output [19:0]R,
           output done);

           wire w_rs;
           wire w_asg;
           wire w_crc;
           wire w_cct;
           wire w_sh;
           wire w_j;

           wire [3:0] w_C;
           wire [3:0] w_D;
           wire [3:0] w_U;

           cct cct0 (.clk(clk), .rs(w_rs), .cct(w_cct), .sh(w_sh),
                     .B(B), .C(w_C), .D(w_D), .U(w_U),
                     .o(R));
           comp comp0 (.clk(clk), .rs(w_rs), .asg(w_asg), .crc(w_crc),
                      .R(R[19:16]),
                      .o(w_C));
           comp comp1 (.clk(clk), .rs(w_rs), .asg(w_asg), .crc(w_crc),
                      .R(R[15:12]),
                      .o(w_D));
           comp comp2 (.clk(clk), .rs(w_rs), .asg(w_asg), .crc(w_crc),
                      .R(R[11:8]),
                      .o(w_U));
           dec dec0 (.clk(clk), .rs(w_rs), .asg(w_asg),
                     .j(w_j));
           control_BIN_BCD control_BIN_BCD0 (.clk(clk), .rst(rst), .init(init), .j(w_j),
                                            .rs(w_rs), .asg(w_asg), .crc(w_crc), .cct(w_cct), .sh(w_sh),
                                            .done(done));
endmodule
