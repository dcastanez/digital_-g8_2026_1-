module control_SUM(
            input clk,
            input rst,
            input init,
            input h,

            output reg rs,
            output reg sh,
            output reg done
            );

parameter CHECK = 2'b00;
parameter LOAD  = 2'b01;
parameter CALC  = 2'b10;
parameter DONE  = 2'b11;

reg [1:0]state;

initial begin
  rs   = 0;
  sh   = 0;
  done = 0;

  state = 0;
end

reg [3:0]count;

  always @(posedge clk) begin
    if (rst)
    state = CHECK;
    else begin
    case(state)

    CHECK: begin
      count = 0;
      if (init) begin
        state = LOAD;
      end
      else state = CHECK;
    end

    LOAD:
      state = CALC;

    CALC: begin
      if (h) begin
        state = DONE;
      end
      else
        state = CALC;
    end

    DONE:begin
      count = count + 1;
      if (count>9)
        state = CHECK;
      else
        state = DONE;
      end

    default:
      state = CHECK;

    endcase
  end
end

always @ (state) begin
    case (state)

      CHECK: begin
        rs  = 0;
        sh  = 0;
        done= 0;
      end

      LOAD: begin
        rs  = 1;
        sh  = 0;
        done= 0;
      end

      CALC: begin
        rs  = 0;
        sh  = 1;
        done= 0;
      end

      DONE: begin
        rs  = 0;
        sh  = 0;
        done= 1;
      end
    endcase
  end
endmodule
