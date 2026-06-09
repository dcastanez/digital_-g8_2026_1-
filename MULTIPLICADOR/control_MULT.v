module control_MULT(
                    input clk,
                    input rst,
                    input init,
                    input B,
                    input z,

                    output reg rs,
                    output reg sh,
                    output reg ad,
                    output reg done
                    );

parameter START = 3'b000;
parameter CHECK = 3'b001;
parameter SHIFT = 3'b010;
parameter ADD   = 3'b011;
parameter CHECK2 = 3'b100;
parameter END  = 3'b101;

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
    if (rst)
      state = START;
    else begin
      case(state)

      START:begin
        count=0;
        if (init)
          state = CHECK;
        else
          state = START;
      end

      CHECK:
        if (B)
          state = ADD;
        else
          state = SHIFT;

      ADD:
        state = SHIFT;

      SHIFT:
        state = CHECK2;

      CHECK2:
        if (z)
          state = END;
        else
          state = CHECK;

      END:begin
        count = count + 1;
        if (count>9)
          state = START;
        else
          state = END;
      end

      default:
        state = START;

      endcase
    end
  end

  always @ (state) begin
    case (state)

      START:begin
        rs   = 1;
        sh   = 0;
        ad   = 0;
        done = 0;
      end

      CHECK:begin
        rs   = 0;
        sh   = 0;
        ad   = 0;
        done = 0;
      end

      ADD:begin
        rs   = 0;
        sh   = 0;
        ad   = 1;
        done = 0;
      end

      SHIFT:begin
        rs   = 0;
        sh   = 1;
        ad   = 0;
        done = 0;
      end

      CHECK2:begin
        rs   = 0;
        sh   = 0;
        ad   = 0;
        done = 0;
      end

      END:begin
        rs   = 0;
        sh   = 0;
        ad   = 0;
        done = 1;
      end

      default:begin
        rs   = 0;
        sh   = 0;
        ad   = 0;
        done = 0;
      end
    endcase
  end
endmodule
