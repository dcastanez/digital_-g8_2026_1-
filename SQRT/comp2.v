module comp2(
             input clk,
             input cct,
             input [7:0]T,
             output reg [7:0]c2
             );

  always @(negedge clk)
    if (cct) begin
      c2 = ~T + 8'b00000001;
    end
endmodule
