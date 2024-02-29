`include "rgb2grey.v"

module randommm;
  reg [23:0] rgb_pixel;
  wire [7:0] grey_pixel;
  rgb2grey uut(.rgb_pixel(rgb_pixel), .grey_pixel(grey_pixel));
  initial begin
    process::self().srandom(100);
    repeat (100) begin
      rgb_pixel = $urandom_range(0,16777215); //2^24-1
      #100;
    end
  end
endmodule
