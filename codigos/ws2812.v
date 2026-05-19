module ws2812(clk, init_led, rst_cmd, rgb, dout, done_led);
  input rgb;
  input init_led;
  input rst_cmd;
  output dout;
  output done_led;

  wire w_sh;
  wire w_init_t;
  wire [1:0]w_sel;
  wire w_dec;
  wire w_ld;

  wire w_msb;
  wire w_done_t;
  wire w_z;

  lsr lsr0 (.clk(clk), .sh(w_sh), .ld(w_ld));
  count count0 (.clk(clk), .dec(w_dec), .ld(w_ld));
  timer timer0 (.clk(clk), .init_t(w_init_t), .sel(w_sel), .done_t(w_done_t));

  endmodule
