`include "src/processor.v"

module testbench;

reg clock = 0;
reg [15:0] iin;
reg resetn = 1;
wire [15:0] bus;

always #1 clock = !clock;

initial $dumpfile("testbench.vcd");
initial $dumpvars(0, testbench);

processor p(clock, iin, resetn, bus);
initial begin
      # 0  resetn = 1'b0;
      # 8  iin = 16'b1010000000011100; // ldi reg0 <- 28
      # 8  iin = 16'b1010010000001010; // ldi reg1 <- 10
      # 8  iin = 16'b0010000010000000; // reg0 - reg1
      # 8  iin = 16'b1000000000000000; // out reg0
      # 8 $finish;
end

endmodule