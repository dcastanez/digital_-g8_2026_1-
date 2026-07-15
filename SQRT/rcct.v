module rcct(
            input clk,
            input rs,
            input cct,
            input s,
            input [1:0]A,
            input [8:0]S,
            output reg [8:0]R
            );

  always @(negedge clk) begin
    if (rs)
      R = 0;
    if (cct)
      R = {R, A};
    if (s)
      R = S;
    else
      R = R;
  end
endmodule
