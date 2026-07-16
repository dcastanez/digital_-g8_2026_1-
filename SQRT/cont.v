module cont(
            input clk,
            input rs,
            input sh,
            output wire j
            );

reg [2:0] h;

 always @ ( posedge clk) begin
   if (rs)
     h = 3'd4;
   if (sh) begin
     if (h > 0)
       h = h - 3'd1;
    end
  end
    assign j = (h == 3'd0);
endmodule
