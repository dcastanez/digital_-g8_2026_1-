module tcct(
            input clk,
            input rs,
            input cct,
            input [7:0] Q,
            output reg [7:0] T
            );

  always @(negedge clk) begin
    if (rs)
      T = 8'b0;
    if (cct) begin
      T = (Q << 2) + 8'b00000001;
    end
    else
      T = T;
  end
endmodule
