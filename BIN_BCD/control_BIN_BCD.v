module control_BIN_BCD(
                    input clk,
                    input init,
                    input rst,
                    input B,
                    input z,

                    output reg rs,
                    output reg asg,
                    output reg crc,
                    output reg cct,
                    output reg sh,
                    output reg done
                    );

parameter START  = 3'b000;
parameter CONCAT = 3'b001;
parameter SHIFT  = 3'b010;
parameter ASIG   = 3'b011;
parameter CHECK1 = 3'b100;
parameter COREG  = 3'b101;
parameter CHECK2 = 3'b110;
parameter DONE   = 3'b111;

reg [2:0]state;

initial begin
  rs  = 0;
  asg = 0;
  crc = 0;
  cct = 0;
  sh  = 0;
  done= 0;

  state = 0;
end

reg [3:0]count;

  always @(posedge clk) begin
    if (rs)
    state = START;
    else begin
    case(state)

    START:begin
      count = 0;
      if (init)
        state = CONCAT;
      else
        state = START;
    end

    CONCAT:
      state = SHIFT;

    SHIFT:
      state = ASIG;

    ASIG:
      state = CHECK;

    CHECK1:
      state = COREG;

    COREG:
      state = CHECK;

    CHECK2:
      if (j)
        state = DONE;
      else
        state = CONCAT;

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

      START: begin
        rs  = 1;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 0;
      end

      CONCAT: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 1;
        sh  = 0;
        done= 0;
      end

      SHIFT: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 1;
        done= 0;
      end

      ASIG: begin
        rs  = 0;
        asg = 1;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 0;
      end

      CHECK1: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 0;
      end

      COREG: begin
        rs  = 0;
        asg = 0;
        crc = 1;
        cct = 0;
        sh  = 0;
        done= 0;
      end

      CHECK2: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 0;
      end

      DONE: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 1;
      end

      default: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 0;
      end
    endcase
  end
endmodule
