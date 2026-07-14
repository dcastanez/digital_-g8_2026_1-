module comp2(
             input [14:0]T,
             output reg [15:0]c2
             );

  always @ (*) begin
    c2 = ~T + 1;
  end
endmodule
