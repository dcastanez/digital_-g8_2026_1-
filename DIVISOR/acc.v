module acc(
           input clk,
           input rs,
           input ac,
           output reg [15:0]R
           );
  initial R = 0;

  always @ (negedge clk)
    if (rs)
      R = 0;
    else begin
      if (ac)
        R = R + 1;
      else
        R = R;
    end
endmodule
