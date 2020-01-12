`include "src/alu.v"

module alu_testbench;

reg [15:0] rdDataA;
reg [15:0] rdDataB;
reg [1:0]  opSelect;
wire [15:0] outData;

initial $dumpfile("alu_testbench.vcd");
initial $dumpvars(0, alu_testbench);

initial
begin
  #1 rdDataA = 35; rdDataB = 5; opSelect = 1;
  #5 opSelect = 0; rdDataB = 23; rdDataA = 35;
  #5 opSelect = 1; rdDataB = 10; rdDataA = 5;
  #5 opSelect = 3; rdDataB = 23;
  #5 rdDataA = 30; rdDataB = 12; opSelect = 2;
  #5 $finish;
end

alu a(rdDataA,rdDataB,opSelect,outData);

endmodule
