module dec(
           input clk,
           input rs,
           input dc,
           input [7:0]c2,
           input [7:0]R,
           output reg [7:0]S
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
