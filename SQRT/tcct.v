module tcct(
            input clk,
            input rs,
            input cct,
            input Q,
            output T
            );

  always @(negedge clk)
    if 
