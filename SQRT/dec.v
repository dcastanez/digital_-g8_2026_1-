module dec(
           input clk,
           input rs,
           input dc,
           input [6:0]c2,
           input [8:0]R,
           output reg [8:0]S
           );
  initial S = 0;

  always @ (negedge clk)
    if (rs)
      S = R;
    else begin
      if (dc)
        S = S + c2;
      else
        S = S;
    end
endmodule
