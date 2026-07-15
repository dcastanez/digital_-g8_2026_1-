module comp2(
             input [5:0]T,
             output reg [6:0]c2
             );

  always @ (*) begin
    c2 = ~T;
    c2 = c2 + 01;
  end
endmodule
