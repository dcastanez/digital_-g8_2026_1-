module control_DIV(
                   input clk,
                   input rst,
                   input init,
                   input NUM,
                   input DEN,
  
                   output rs,
                   output de,
                   output ac,
                   output done
                   );
  parameter CHECK = 3'b000;
  parameter START = 3'b001;
  parameter DECR = 3'b010;
  parameter ACC   = 3'b011;
  parameter DONE  = 3'b100;

  reg [2:0] state;

  initial begin
    rs = 0;
    de = 0;
    ac = 0;
    done = 0;

    state = 0;
  end
    
