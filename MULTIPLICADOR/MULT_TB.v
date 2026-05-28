`timescale 1ns/1pcs
`define SIMULATION
module MULT_TB;
  reg clk;
  reg init;
  reg rst;
  reg [15:0] A;
  reg [15:0] B;
  
  wire [31:0] R;
  wire done;

  MULT uut (.clk(clk), .init(init), .rst(rst), .A(A), .B(B),
            .R(R), .done(done));
  parameter          PERIOD = 20;
  parameter real DUTY_CYCLE = 0.5;
  parameter          OFFSET = 0;
  reg [20:0] i;
    event reset_trigger;
    event reset_done_trigger;
    initial begin
      forever begin
        @(reset_trigger);
        @(negedge clk); rst = 1;
        @(negedge clk); rst = 0;
