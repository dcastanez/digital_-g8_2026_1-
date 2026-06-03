module dec(
           input clk,
           input rs,
           input de,
           input c2,
           input NUM,
           output DP
           );
  inital DP = NUM
  always @ (negedge clk)
    if (rs)
      DP = NUM;
    else begin
      if (de)
        DP = DP + c2;
      else
        DP = DP;
    end
endmodule
