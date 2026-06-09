module comp2(
             input [14:0]DEN,
             output reg [15:0]c2
             );

  always @ (*) begin
    c2 = ~DEN + 1;
  end
endmodule
