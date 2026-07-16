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
  parameter START  = 3'b000;
  parameter CONCAT = 3'b001;
  parameter DEC    = 3'b010;
  parameter CHECK1 = 3'b011;
  parameter ASIG   = 3'b100;
  parameter SHIFT  = 3'b101;
  parameter CHECK2 = 3'b110;
  parameter DONE   = 3'b111;

reg [3:0] state;

initial begin
    rs = 0;
    dc = 0;

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
          state = CONCAT;
        else
          state = START;
      end

      CONCAT:
        state = DEC;

      DEC:
        state = CHECK1;

      CHECK1:begin
        if (S)
          state = SHIFT;
        else
          state = ASIG;
      end

      ASIG:
        state = SHIFT;

      SHIFT:
        state = CHECK2;

      CHECK2:
        if (j)
          state = DONE;
        else
          state = CONCAT;

      DONE:begin
        count = count + 1;
        if (count>9)
          state = START;
        else
          state = DONE;
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
        cct  = 0;
        dc   = 0;
        s    = 0;
        sh   = 0;
        done = 0;
      end

      CONCAT:begin
        rs   = 0;
        cct  = 1;
        dc   = 0;
        s    = 0;
        sh   = 0;
        done = 0;
      end

      DEC:begin
        rs   = 0;
        cct  = 0;
        dc   = 1;
        s    = 0;
        sh   = 0;
        done = 0;
      end

      CHECK1:begin
        rs   = 0;
        cct  = 0;
        dc   = 0;
        s    = 0;
        sh   = 0;
        done = 0;
      end

      ASIG:begin
        rs   = 0;
        cct  = 0;
        dc   = 0;
        s    = 1;
        sh   = 0;
        done = 0;
      end

      SHIFT:begin
        rs   = 0;
        cct  = 0;
        dc   = 0;
        s    = 0;
        sh   = 1;
        done = 0;
      end

      CHECK2:begin
        rs   = 0;
        cct  = 0;
        dc   = 0;
        s    = 0;
        sh   = 0;
        done = 0;
      end

      DONE:begin
        rs   = 0;
        cct  = 0;
        dc   = 0;
        s    = 0;
        sh   = 0;
        done = 1;
      end

      default:begin
        rs   = 0;
        cct  = 0;
        dc   = 0;
        s    = 0;
        sh   = 0;
        done = 0;
      end
    endcase
  end
endmodule
