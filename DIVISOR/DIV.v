module DIV(
           input clk,
           input init,
           input rst,
           input [15:0] A,
           input [15:0] B,
           output done);

           wire w_rs;
           wire w_sh;
           wire w_de;
           wire [31:0] w_R;
           wire w_j;

           lsr lsr0 (.clk(clk), .rs(w_rs), .sh(w_sh), .i_A(A),
                     .R(w_R));
           comp comp0 (.B(B)
                       .j(w_j));
           dec dec0 (.clk(clk), .rs(w_rs), .ad(w_ad), .j(w_j),
                     .R(w_R))
