module comp(
            input A,
            input B,
            input Cin,
            output reg S,
            output reg Coutt
            );

always @(*) begin
  if (A == B) begin
    if (A == 1'b1) begin
      S = Cin;
      Coutt = 1'b1;
    end
    else begin
      S = Cin;
      Coutt = 1'b0;
    end
  end

  else begin
    if (Cin == 1'b1) begin
      S = 1'b0;
      Coutt = 1'b1;
    end
    else begin
      S = 1'b1;
      Coutt = 1'b0;
    end
  end
end
endmodule
