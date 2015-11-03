`include "src/register_file.v"

module register_file_testbench;

reg clk = 0;
reg reset = 0;
reg write;
reg [2:0] rdAddrA;
reg [2:0] rdAddrB;
reg [2:0] wrAddr;
reg [15:0] wrData;

wire [15:0] rdDataA;
wire [15:0] rdDataB;

always #1 clk = !clk;

initial $dumpfile("register_file_testbench.vcd");
initial $dumpvars(0, register_file_testbench);

initial
begin
  #1 reset = 1;
  #1 reset = 0;
  #2 write = 1; wrData = 23; wrAddr = 3;
  #2 write = 0; wrData = 45; wrAddr = 3; rdAddrA = 3; rdAddrB = 0;
  #2 write = 1; wrData = 31; wrAddr = 2; rdAddrA = 3;
  #2 write = 0; rdAddrA = 3; rdAddrB = 2;
  #2 $finish;
end

register_file r(clk, reset, write, wrAddr, wrData, rdAddrA, rdDataA,rdAddrB, rdDataB);

endmodule
