module BCD_BIN(
           input clk,
           input init,
           input rst,
           input [11:0] BCD,
           output [19:0] R,
           output done);

           wire w_rs;
           wire w_asg;
           wire w_crc;
           wire w_cct;
           wire w_sh;
           wire w_h;
           wire w_ch;

           wire [3:0] w_C;
           wire [3:0] w_D;
           wire [3:0] w_U;
           wire [7:0] w_B;

           cct cct0 (.clk(clk), .rs(w_rs), .cct(w_cct), .sh(w_sh), .ch(w_ch),
                     .B(w_B), .C(w_C), .D(w_D), .U(w_U), .BCD(BCD),
                     .R(R));
           comp comp0 (.clk(clk), .rs(w_rs), .ch(w_ch), .asg(w_asg), .crc(w_crc),
                      .BCD(BCD[11:8]), .R(R[19:16]),
                      .o(w_C));
           comp comp1 (.clk(clk), .rs(w_rs), .ch(w_ch), .asg(w_asg), .crc(w_crc),
                      .BCD(BCD[7:4]), .R(R[15:12]),
                      .o(w_D));
           comp comp2 (.clk(clk), .rs(w_rs), .ch(w_ch), .asg(w_asg), .crc(w_crc),
                      .BCD(BCD[3:0]), .R(R[11:8]),
                      .o(w_U));
           compb compb0 (.clk(clk), .rs(w_rs), .asg(w_asg), .crc(w_crc),
                      .B(8'b00000000), .R(R[7:0]),
                      .o(w_B));
           cont cont0 (.clk(clk), .rs(w_rs), .asg(w_asg),
                       .h(w_h));
           control_BCD_BIN control_BCD_BIN0 (.clk(clk), .rst(rst), .init(init), .h(w_h),
                                            .rs(w_rs), .asg(w_asg), .crc(w_crc), .cct(w_cct), .sh(w_sh), .ch(w_ch),
                                            .done(done));
endmodule
