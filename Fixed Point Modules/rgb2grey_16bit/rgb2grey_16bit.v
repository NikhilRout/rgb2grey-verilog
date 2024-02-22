module rgb2grey_16bit(
  input [23:0] rgb_pixel,
  output [7:0] grey_pixel
);
  wire [7:0] red, green, blue;
  multiplier red_w(.original(rgb_pixel[23:16]),.coefficient(8'h4D), .weighted(red));
  multiplier green_w(.original(rgb_pixel[15:8]), .coefficient(8'h97), .weighted(green));
  multiplier blue_w(.original(rgb_pixel[7:0]), .coefficient(8'h1D), .weighted(blue));
  assign grey_pixel = red + green + blue;
endmodule

module multiplier(
  input [7:0] original, coefficient,
  output [7:0] weighted
);
  reg [15:0] org_extended, coeff_extended;
  reg [31:0] product, partial_products;
  integer i,j;
  always@(*) begin
    org_extended = {original, 8'h00};
    coeff_extended = {8'h00, coefficient};
    product = 32*{1'b0};
    for (i= 0;i<16;i=i+1) begin
      partial_products = (16)*{1'b0};
      for (j = 0; j<16; j=j+1) begin
        partial_products = partial_products >> 1;
        partial_products[15] = org_extended[i] & coeff_extended[j];
      end
      partial_products = partial_products << i;
      product = product + partial_products;
    end
  end
  assign weighted = product[23:16];
endmodule
