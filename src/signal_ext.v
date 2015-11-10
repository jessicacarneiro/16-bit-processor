module signal_ext(
input  [8:0]  iin,
output [15:0] out);

reg [15:0] out16bits;

assign out = out16bits;

always @(*) begin
  if(iin[8] == 1'b1)
    out16bits[15:9] = 7'b1111111;
  else
    out16bits[15:9] = 7'b0000000;

  out16bits[8:0] = iin;
end

endmodule
