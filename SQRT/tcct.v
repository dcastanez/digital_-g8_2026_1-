module tcct(
            input clk,
            input rs,
            input cct,
            input [4:0] Q,
            output reg [5:0] T
            );

  always @(negedge clk) begin
    if (rs)
      T = 0;
    if (cct) begin
      T = Q << 2;
      T = T + 01;
    end
    else
      T = T;
  end
endmodule
