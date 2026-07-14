module rcct(
            input clk,
            input rs,
            input cct,
            input s,
            input A,
            input S,
            output R
            );

  always @(negedge clk)
    if 
