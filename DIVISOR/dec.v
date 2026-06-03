module dec(
           input clk,
           input rs,
           input de,
           input c2,
           input NUM,
           output DP
           );
  initial DP = 0
           
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
