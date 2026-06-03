module DIV(
           input clk,
           input init,
           input rst,
           input [15:0] NUM,
           input [14:0] DEN,
           output [15:0] R,
           output done);

           wire w_rs;
           wire w_de;
           wire w_ac;

           wire [15:0] w_DEN;
           wire w_DP;
           
           comp2 comp20 (.DEN(DEN),
                         .c2(w_DEN));
           dec dec0 (.clk(clk), .rs(w_rs), .de(w_de), .c2(w_DEN), .NUM(NUM),
                     .DP(w_DP));
           acc acc0 (.clk(clk), .rs(w_rs), .ac(w_ac),
                     .R(R));
           control_DIV control_DIV0 (.clk(clk), .rst(rst), .init(init), .NUM(NUM), .DEN(DEN),
                                     .rs(w_rs), .sh(w_sh), .ac(w_ac), .done(done));
endmodule
