module dec(
           input clk,
           input rs,
           input asg,
           output reg [2:0]j
           );
  initial j = 3'b111;

  always @ (negedge clk)
    if (rs)
      j = 3'b111;
    else begin
      if (asg)
        j = j - 3'b001;
      else
        j = j;
    end
endmodule
