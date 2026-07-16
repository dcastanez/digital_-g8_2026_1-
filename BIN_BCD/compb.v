module compb(
            input clk,
            input rs,
            input asg,
            input crc,
            input [7:0] B,
            input [7:0] R,
            output reg [7:0]o
            );

  always @ (negedge clk)
    if (rs)
      o = B;
    else if (asg)
      o = R;
    else
      o = o;
endmodule
