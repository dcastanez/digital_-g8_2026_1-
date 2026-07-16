module qcct(
            input clk,
            input rs,
            input sh,
            input S,
            output reg [7:0]Q
            );

  always @(negedge clk) begin
    if (rs)
      Q = 8'b0;
    if (sh) begin
      Q = (Q << 1) + {7'b0,~S};
      //Q = {Q, S};
    end
    else
      Q = Q;
  end
endmodule
