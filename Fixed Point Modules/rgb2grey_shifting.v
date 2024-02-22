module rgb2grey_shifting(
  input [23:0] rgb_pixel,
  output reg [7:0] grey_pixel
);
  reg [7:0] red, green, blue;
  always @(*) begin

    red = rgb_pixel[23:16];
    blue = rgb_pixel[15:8];
    green = rgb_pixel[7:0];
    
    red = red >> 2;
    grey_pixel = red;
    red = red >> 3;
    grey_pixel = grey_pixel + red;
    red = red >> 1;
    grey_pixel = grey_pixel + red;

    blue = blue >> 1;
    grey_pixel = grey_pixel + blue;
    blue = blue >> 3;
    grey_pixel = grey_pixel + blue;
    blue = blue >> 2;
    grey_pixel = grey_pixel + blue;
    blue = blue >> 1;
    grey_pixel = grey_pixel + blue;  


    green = green >> 4;
    grey_pixel = grey_pixel + green;
    green = green >> 1;
    grey_pixel = grey_pixel + green;
    green = green >> 1;
    grey_pixel = grey_pixel + green;
    green = green >> 2;
    grey_pixel = grey_pixel + green;

  end
endmodule


/*
module rgb2grey_shifting(
  input [23:0] rgb_pixel,
  output reg [7:0] grey_pixel
);
  reg [7:0] red, green, blue;
  reg [7:0] red_w, green_w, blue_w;
  always @(*) begin
    red = rgb_pixel[23:16];
    blue = rgb_pixel[15:8];
    green = rgb_pixel[7:0];
    
    red = red >> 2;
    red_w = red;
    red = red >> 3;
    red_w = red_w + red;
    red_w = red >> 1;
    red_w = red_w + red;

    blue = blue >> 1;
    blue_w = blue;
    blue = blue >> 3;
    blue_w = blue_w + blue;
    blue = blue >> 2;
    blue_w = blue_w + blue;
    blue = blue >> 1;
    blue_w = blue_w + blue;  


    green = green >> 4;
    green_w = green;
    green = green >> 1;
    green_w = green_w + green;
    green = green >> 1;
    green_w = green_w + green;
    green = green >> 2;
    green_w = green_w + green;

    grey_pixel = red_w + green_w + blue_w;
  end
endmodule
*/