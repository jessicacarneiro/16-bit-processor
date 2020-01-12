`include "src/counter.v"

module counter_testbench;

reg clock = 0;
reg clear = 0;
wire [1:0] out;

always #1 clock = !clock;

initial $dumpfile("counter_testbench.vcd");
initial $dumpvars(0, counter_testbench);

initial
begin
  #1 clear = 1;
  #1 clear = 0;
  #25 clear = 1;
  #28 clear = 0;
  #50 $finish;
end

counter c(clock,clear,out);

endmodule
