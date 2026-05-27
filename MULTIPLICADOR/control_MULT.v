module control_MULT(
                    input clk,
                    input rst,
                    input init,
                    input B,
                    input z,
                    output rs,
                    output sh,
                    output ad,
                    output done
                    );

parameter CHECK = 3'b000;
parameter START = 3'b001;
parameter SHIFT = 3'b010;
parameter ADD   = 3'b011;
parameter DONE  = 3'b100;

reg [2:0]state;

initial begin
  rs = 0;
  sh = 0;
  ad = 0;
  done = 0;

  state = 0;
end

reg [3:0]count;

  always @(posedge clk) begin
    if (rs)
      state = CHECK;
    else
      case(state)

      CHECK:begin
        count=0;
        if (init)
          state = START;
        else
          state = CHECK;
      end

      START:
        if (B)
          state = ADD;
        else
          state = SHIFT;

      SHIFT:
        if (B)
          state = ADD;
        else
          state = SHIFT;
