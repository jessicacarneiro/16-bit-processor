`include "src/signal_ext.v"
module signal_ext_testbench;

reg [8:0] iin = 0;
wire [15:0] outData;

initial $dumpfile("signal_ext_testbench.vcd");
initial $dumpvars(0, signal_ext_testbench);

initial
begin
  #1 iin = 9'b111100000;
  #1 iin = 9'b000011110;
  #1 iin = 9'b101010100;
  #1 iin = 9'b110000000;
  #1 iin = 9'b110101010;
  #1 iin = 9'b000000001;
  #1 $finish;
end

signal_ext s(iin, outData);

endmodule
