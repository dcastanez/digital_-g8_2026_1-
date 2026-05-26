module rsl(
           input clk,
           input rs,
           input sh,
           input [15:0]i_A,
           output [31:0]o_A
           );

  always @(negedge clk)
    if (rs)
      o_A = i_A;
    else begin
      if (sh)
        o_A = o_A << 1;
      else
        o_A = o_A;
    end
endmodule
