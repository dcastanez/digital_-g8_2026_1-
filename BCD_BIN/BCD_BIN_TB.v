`timescale 1ns / 1ps
`define SIMULATION

module BCD_BIN_TB;
  reg clk;
  reg init;
  reg rst;
  reg [11:0] BCD;

  wire [19:0] R;
  wire done;

  BCD_BIN uut (.clk(clk), .init(init), .rst(rst), .BCD(BCD),
           .R(R), .done(done));
  parameter PERIOD          = 20;
  parameter real DUTY_CYCLE = 0.5;
  parameter OFFSET          = 0;

  event reset_trigger;
  event reset_done_trigger;
  initial begin
    forever begin
      @(reset_trigger);
      @(negedge clk);
        rst = 1;
      @(negedge clk);
        rst = 0;
        -> reset_done_trigger;
    end
  end

  initial begin
    clk = 0;
    init = 0;
    rst = 0;
    BCD = 12'b000101010110;
  end

  initial begin
    #OFFSET;
    forever begin
      clk = 1'b0;
      #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
      #(PERIOD*DUTY_CYCLE);
    end
  end

  reg [20:0] i;
  initial begin
    #10 -> reset_trigger;
    @ (reset_done_trigger);
    @ (posedge clk); init = 0;
    @ (posedge clk); init = 1;
    for (i = 0; i < 2; i = i + 1) begin
      @ (posedge clk);
    end
    init = 0;
    for (i = 0; i < 17; i = i + 1) begin
      @ (posedge clk);
    end
  end

  initial begin: TEST_CASE
    $dumpfile("BCD_BIN_TB.vcd");
    $dumpvars(-1,uut);
    #((PERIOD*DUTY_CYCLE)*200)$finish;
  end
endmodule
