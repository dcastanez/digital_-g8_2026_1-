module SQRT(
            input clk,
            input init,
            input rst,
            input [7:0] A,
            output [3:0] R,
            output done);

            wire w_rs;
            wire w_cct;
            wire w_dc;
            wire w_s;
            wire w_sh;

            wire [7:0] w_A;
            wire [7:0] T;
            wire [7:0] w_T;
            wire [3:0] w_S;
            wire w_j;

            lsr lsr0 (.clk(clk), .rs(w_rs), .sh(w_sh), .i_A(A),
                      .o_A(w_A));

            qcct qcct0 (.clk(clk), .rs(w_rs), .sh(w_sh),
                        .T(T),
                        .S(w_S));

            rcct rcct0 (.clk(clk), .rs(w_rs), .cct(w_cct), .s(w_s),
                        .A(w_A), .S(w_S),
                        .R(R));

            tcct tcct0 (.clk(clk), .rs(w_rs), .cct(w_cct),
                          .Q(Q),
                          .T(T));

            dec dec0 (.clk(clk), .rs(w_rs), .dc(w_dc),
                      .R(R), .c2(w_T),
                      .S(w_S));

            comp2 comp20 (.T(T),
                          .c2(w_T));

            control_SQRT control_SQRT0 (.clk(clk), .rst(rst), .init(init), .S(w_S[7]), .j(w_j),
                                        .rs(w_rs), .cct(w_cct), .dc(w_dc), .s(w_s), .sh(w_sh), .done(done));
endmodule
