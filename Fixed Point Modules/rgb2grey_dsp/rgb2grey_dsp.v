module rgb2grey_dsp(
  input [23:0] rgb_pixel,
  output [7:0] grey_pixel
);
  reg [7:0] red_c, green_c, blue_c;
  reg [15:0] red_o, green_o, blue_o;
  reg [23:0] red_w, green_w, blue_w, weighted;
  always @(*) begin
    red_c = 8'h4C;
    green_c = 8'h96;
    blue_c = 8'h1D;
    red_o = {rgb_pixel[23:16], 8'h00};
    green_o = {rgb_pixel[15:8], 8'h00};
    blue_o = {rgb_pixel[7:0], 8'h00};
    red_w = red_c * red_o;
    green_w = green_c * green_o;
    blue_w = blue_c * blue_o;
    weighted = red_w + green_w + blue_w;
  end
  assign grey_pixel = weighted[23:16];
endmodule
