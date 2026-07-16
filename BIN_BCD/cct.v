module cct(
            input clk,
            input rs,
            input cct,
            input sh,
            input [7:0] B,
            input [3:0] C,
            input [3:0] D,
            input [3:0] U,
            output reg [19:0] R
            );
initial R = 0;

  always @(negedge clk) begin
    if (cct)
      R = {C, D, U, B};
    if (sh)
      R = R << 1;
    else
      R = R;
  end
endmodule
