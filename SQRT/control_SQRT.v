module control_SQRT(
                   input clk,
                   input rst,
                   input init,
                   input S,
                   input j,

                   output reg rs,
                   output reg cct,
                   output reg dc,
                   output reg s,
                   output reg sh,
                   output reg done
                   );
  parameter CHECK = 3'b000;
  parameter START = 3'b001;
  parameter DEC = 3'b010;
  parameter ACC   = 3'b011;
  parameter END  = 3'b100;

reg [2:0] state;

initial begin
    rs = 0;
    dc = 0;

  end

  reg [3:0] count;

  always @(posedge clk) begin
    if (rst)
      state = START;
    else begin
      case (state)
