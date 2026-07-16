module carr(
            input clk,
            input rs,
            input sh,
            input Coutt,
            output reg Cin
            );

always @(negedge clk) begin
  if (rs)
    Cin = 1'b0;
  else if (sh)
    Cin = Coutt;
end
endmodule

