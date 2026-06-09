`timescale 1ns / 1ps
`define SIMULATION
module acc_TB;
  reg clk;
  reg rs;
  reg ad;
  reg [31:0]A;

  wire [31:0]R;

  acc uut (.clk(clk), .rs(w_rs), .ad(w_ad), .A(w_A),
            .r(R));

  parameter PERIOD = 20;
  parameter real DUTY_CYCLE = 0.5;
  parameter OFFSET = 0;

  reg [20:0] i;
    event reset_trigger;
    event reset_done_trigger;
    initial begin
      forever begin
        @(reset_trigger);
        @(negedge clk); rs = 1;
        @(negedge clk); rs = 0;
        -> reset_done_trigger;
      end
    end

  initial begin
    clk = 0;
    rs = 0;
    ad = 0;
    A = 16'b0000000000000101;
  end

  initial begin
    #OFFSET;
    forever begin
      clk = 1'b0;
      #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
      #(PERIOD*DUTY_CYCLE);
    end
  end

  initial begin: TEST_CASE
    $dumpfile("acc_TB.vcd");
    $dumpvars(-1, uut);
    #((PERIOD*DUTY_CYCLE)*120)$finish;
  end
endmodule
