module counter
( input clock,
  input clear,
  output [1:0] out);

reg [1:0] outReg;

assign out = outReg;

always@(posedge clock)
begin
  if(clear == 1)
    outReg <= 2'b00;
  else
    outReg <= outReg + 1'b1;
end

endmodule
