module acc(
            input clk,
            input rs,
            input sh,
            input [3:0]j,
            input Sj,
            output reg [3:0]S
            );

always @(negedge clk) begin
  if (rs)
    S = 3'b0;
  else if (sh)
    S[j] = Sj;
end
endmodule
