module cont(
            input clk,
            input rs,
            input sh,
            output reg [3:0]j
            );

initial j = 0;

 always @ ( posedge clk) begin
   if (rs) begin
    j = 4'b0100;
    if (sh)
      j = j - 4'b0001;
    else
      j = j;
    end
  end
endmodule
