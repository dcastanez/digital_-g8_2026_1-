module cont(
            input clk,
            input rs,
            input asg,
            output reg [3:0]j,
            output reg h
            );

 always @ ( posedge clk) begin
  if (rs) begin
    j = 8;
    h = 0;
  end
  if (asg)
    j = j - 4'b0001;
  else
    j = j;
  if (j==0)
    h = 1;
  else
    h = h;
  end
endmodule
