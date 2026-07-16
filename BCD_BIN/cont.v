module cont(
            input clk,
            input rs,
            input asg,
            output reg [3:0]j,
            output wire h
            );

  always @ ( posedge clk) begin
    if (rs)
      j = 4'd8;
    else if (asg) begin
      if (j > 0)
        j = j - 4'd1;
      else
        j = j;
    end
  end
assign h = (j==0);
endmodule
