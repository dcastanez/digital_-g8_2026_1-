module comp(
            input [15:0]B,
            output reg z
            );

  always @ (*) begin
    if (B == 0)
      z = 1;
    else
      z = 0;
  end
endmodule
