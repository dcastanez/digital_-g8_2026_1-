module comp(
            input clk,
            input rs,
            input asg,
            input crc,
            input [3:0]R,
            output reg [3:0]o
            );

  always @ (negedge clk)
    if (R>=8'd5)
      o = R + 2'b11;
    else
      o = o;
endmodule
