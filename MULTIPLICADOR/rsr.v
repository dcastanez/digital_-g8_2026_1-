module rsr(
           input clk,
           input rs,
           input sh,
           input [15:0]i_B,
           output [15:0]o_B
           );

  always @(negedge clk)
    if (rs)
      o_B = i_B;
    else begin
      if (sh)
        o_B = o_B << 1;
      else
        o_B = o_B;
    end
endmodule
