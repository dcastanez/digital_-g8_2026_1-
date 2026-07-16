module comp(
            input clk,
            input rs,
            input ch,
            input asg,
            input crc,
            input [3:0]BCD,
            input [3:0]R,
            output reg [3:0]o
            );

  always @ (negedge clk) begin
    if (rs)
      o = 4'b0;
    else if (ch)
      o = BCD;
    else if (asg)
      o = R;
    else if (crc) begin
      if (R >= 4'b1000)
        o = R - 4'b0011;
      else
        o = R;
    end
  end
endmodule
