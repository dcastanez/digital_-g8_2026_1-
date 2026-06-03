module dec(
           input clk,
           input rs,
           input de,
           input [15:0]c2,
           input [15:0]NUM,
           output [15:0]DP
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
