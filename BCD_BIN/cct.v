module cct(
            input clk,
            input rs,
            input ch,
            input cct,
            input sh,
            input [7:0] B,
            input [11:0]BCD,
            input [3:0] C,
            input [3:0] D,
            input [3:0] U,
            output reg [19:0] R
            );

  always @(negedge clk) begin
    if (rs)
      R = 20'b0;
    if (ch)
      R = {BCD, B};
    if (cct)
      R = {C, D, U, B};
    if (sh)
      R = R >> 1;
    else
      R = R;
  end
endmodule
