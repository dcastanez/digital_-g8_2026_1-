module rcct(
            input clk,
            input rs,
            input cct,
            input s,
            input [1:0]A,
            input [7:0]S,
            output reg [7:0]R
            );

  always @(negedge clk) begin
    if (rs)
      R = 8'b0;
    if (cct) begin
      R = (R << 2) + {6'b0,A};
    end
    if (s)
      R = S;
    else
      R = R;
  end
endmodule
