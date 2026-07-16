module cont(
            input clk,
            input rs,
            input sh,
            output reg [3:0] j,
            output wire h
            );

always @(posedge clk) begin
  if (rs)
    j = 4'd0;
  else if (sh)
    if (j<4)
      j = j +4'd1;
  else
  j = j;
end

assign h = (j == 4);
endmodule
