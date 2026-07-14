module qcct(
            input clk,
            input rs,
            input sh,
            input S,
            input Q
            );

  always @(negedge clk)
    if 
