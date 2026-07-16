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
      S = 8'b0;
    else begin
      if (dc) begin
        S = R + c2;
        //S = S + c2;
        //if (S[7])
          //S = R;
        //else
          //S = S + c2;
      end
    end
endmodule
