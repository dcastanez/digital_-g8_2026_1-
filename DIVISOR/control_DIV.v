module control_DIV(
                   input clk,
                   input rst,
                   input init,
                   input DP,

                   output reg rs,
                   output reg de,
                   output reg ac,
                   output reg done
                   );
  parameter CHECK = 3'b000;
  parameter START = 3'b001;
  parameter DEC   = 3'b010;
  parameter ACC   = 3'b011;
  parameter END   = 3'b100;

  reg [2:0] state;

  initial begin
    rs = 0;
    de = 0;
    ac = 0;
    done = 0;

    state = 0;
  end

  reg [3:0]count;

  always @(posedge clk) begin
    if (rst)
      state = START;
    else begin
      case(state)

      START:begin
        count=0;
        if (init)
          state = DEC;
        else
          state = START;
      end

      DEC:
        state = CHECK;

      CHECK:begin
        if (DP)
          state = END;
        else
          state = ACC;
      end

      END:begin
        count = count + 1;
        if (count>9)
          state = START;
        else
          state = END;
      end

      ACC:
        state = DEC;

      default:
        state = START;

      endcase
    end
  end

  always @ (state) begin
    case (state)

      START:begin
        rs   = 1;
        de   = 0;
        ac   = 0;
        done = 0;
      end

      DEC:begin
        rs   = 0;
        de   = 1;
        ac   = 0;
        done = 0;
      end

      CHECK:begin
        rs   = 0;
        de   = 0;
        ac   = 0;
        done = 0;
      end

      ACC:begin
        rs   = 0;
        de   = 0;
        ac   = 1;
        done = 0;
      end

      END:begin
        rs   = 0;
        de   = 0;
        ac   = 0;
        done = 1;
      end

      default:begin
        rs   = 0;
        de   = 0;
        ac   = 0;
        done = 0;
      end
    endcase
  end
endmodule
