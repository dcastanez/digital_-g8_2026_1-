module send_n_leds(clk, rst, init, done);
  input rst;
  input clk;
  input init_m;
  input rst_cmd;
  output done_m;
  output dout;

  wire w_rst_cmd;
  wire w_init_led;
  wire w_rst;
  wire w_inc;

  wire w_addr;
  wire [23:0]w_rgb;

  wire w_done_led;
  wire w_z;

  count_addr conut_adrr0 (.clk(clk), .load(w_rst), .inc(w_inc), .addr(w_addr));
  comp comp0 (.clk(clk), .addr(w_addr), .z(w_z));
  led_mem led_mem0 (.addr(w_addr), .rgb(w_rgb));
  ws2812 ws28120 (.clk(clk), .init(w_init_led), .rgb(w_rgb), .rst_cmd(w_rst_cmd), .dout(w_done_led),
                  .done_m(w_done_led));

  endmodule
