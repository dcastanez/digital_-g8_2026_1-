 module SUM (
             input clk,
             input init,
             input rst,
             input [3:0] A,
             input [3:0] B,
             output [3:0] S,
             output Cout,
             output done);

             wire w_rs;
             wire w_sh;
             wire w_h;
             wire [3:0] w_j;
             wire w_Sj;
             wire w_Coutt;
             wire w_Cin;

             wire w_A = A[w_j];
             wire w_B = B[w_j];

             comp comp0 (.A(w_A), . B(w_B), .Cin(w_Cin),
                        .S(w_Sj), .Coutt(w_Coutt)
                        );

             acc acc0 (.clk(clk), .rs(w_rs), .sh(w_sh),
                       .j(w_j),
                       .Sj(w_Sj), .S(S));

             carr carr0 (.clk(clk), .rs(w_rs), .sh(w_sh),
                         .Coutt(w_Coutt), .Cin(w_Cin));

             cont cont0 (.clk(clk), .rs(w_rs), .sh(w_sh),
                         .j(w_j),
                         .h(w_h));

             control_SUM control_SUM0 (.clk(clk), .rst(w_rs), .init(init),
                                       .h(w_h), .sh(w_sh), .rs(w_rs), .done(done));
endmodule
