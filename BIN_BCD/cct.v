module cct(
            input clk,
            input rs,
            input cct,
            input sh,
            input B,
            input C,
            input D,
            input U,
            output reg R
            );

  always @(negedge clk) begin
    if (rs)
      C = 0;
      D = 0;
      U = 0;
    if (cct)
      R = {C, D, U, B};
    if (sh)
      R = R << 1;
    else
      R = R;
  end
endmodule
