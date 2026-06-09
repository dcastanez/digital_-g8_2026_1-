module acc(
           input clk,
           input rs,
           input ad,
           input [31:0]A,
           output reg [31:0]r
           );
  initial r = 0;

  always @ (negedge clk)
    if (rs)
      r = 0;
    else begin
      if (ad)
        r = r + A;
      else
        r = r;
    end
endmodule
