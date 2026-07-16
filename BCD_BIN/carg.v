module carg(
            input clk,
            input rs,
            input ch,
            input [11:0]BCD,
            output reg [3:0]C,
            output reg [3:0]D,
            output reg [3:0]U
            );

  always @ (negedge clk)
    if (rs) begin
      C = 0;
      D = 0;
      U = 0;
    end
    else if (ch) begin
      C = BCD[11: 8];
      D = BCD[ 7: 4];
      U = BCD[ 3: 0];
    end
    else begin
      C = C;
      D = D;
      U = U;
      end
endmodule
