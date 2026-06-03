module acc(
           input clk,
           input rs,
           input ac,
           output [:0]R
           );
  initial R = 0;

  always @ (negedge clk)
    if (rs)
      r = 0;
    else
      if (ac)
        R = R + 1;
      else
        R = R;
    end
endmodule
