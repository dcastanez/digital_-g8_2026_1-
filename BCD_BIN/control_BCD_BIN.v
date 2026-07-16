module control_BCD_BIN (
                    input clk,
                    input init,
                    input rst,
                    input B,
                    input h,

                    output reg rs,
                    output reg asg,
                    output reg crc,
                    output reg cct,
                    output reg sh,
                    output reg done,
                    output reg ch
                    );

parameter START  = 4'b0000;
parameter CONCAT = 4'b0001;
parameter SHIFT  = 4'b0010;
parameter ASIG   = 4'b0011;
parameter CHECK1 = 4'b0100;
parameter COREG  = 4'b0101;
parameter CHECK2 = 4'b0110;
parameter DONE   = 4'b0111;
parameter CARG   = 4'b1000;

reg [3:0]state;

initial begin
  rs  = 0;
  asg = 0;
  crc = 0;
  cct = 0;
  sh  = 0;
  done= 0;
  ch  = 0;

  state = 0;
end

reg [3:0]count;

  always @(posedge clk) begin
    if (rst)
    state = START;
    else begin
    case(state)

    START:begin
      count = 0;
      if (init)begin
        state = CARG;
      end
      else
        state = START;
    end

    CARG:
      state = CONCAT;

    CONCAT:
      state = SHIFT;

    SHIFT:
      state = ASIG;

    ASIG:
      state = CHECK1;

    CHECK1:
      state = COREG;

    COREG:
      state = CHECK2;

    CHECK2:
      if (h)
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

      START: begin
        rs  = 1;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 0;
        ch  = 0;
      end

      CARG: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 0;
        ch  = 1;
      end

      CONCAT: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 1;
        sh  = 0;
        done= 0;
        ch  = 0;
      end

      SHIFT: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 1;
        done= 0;
        ch  = 0;
      end

      ASIG: begin
        rs  = 0;
        asg = 1;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 0;
        ch  = 0;
      end

      CHECK1: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 0;
        ch  = 0;
      end

      COREG: begin
        rs  = 0;
        asg = 0;
        crc = 1;
        cct = 0;
        sh  = 0;
        done= 0;
        ch  = 0;
      end

      CHECK2: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 0;
        ch  = 0;
      end

      DONE: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 1;
        ch  = 0;
      end

      default: begin
        rs  = 0;
        asg = 0;
        crc = 0;
        cct = 0;
        sh  = 0;
        done= 0;
        ch  = 0;
      end
    endcase
  end
endmodule
