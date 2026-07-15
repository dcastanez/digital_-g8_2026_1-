module lsr(
           input clk,
           input rs,
           input sh,
           input [7:0]i,
           output reg [7:0]o
           );

  always @(negedge clk)
    if (rs)
      o = i;
    else begin
      if (sh)
        o = o << 2;
      else
        o = o;
    end
endmodule
