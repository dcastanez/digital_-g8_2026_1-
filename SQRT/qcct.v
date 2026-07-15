module qcct(
            input clk,
            input rs,
            input cct,
            input sh,
            input S,
            output reg [4:0]Q
            );

  always @(negedge clk) begin
    if (rs)
      Q = 0;
    if (sh) begin
      //esto es concatenación de forma burda pero creo que sí serviría en caso dado, (corrimiento izquierda) + S
      //Q = Q << 1;
      //Q = Q + S;
      Q = {Q, S};
    end
    else
      Q = Q;
  end
endmodule
