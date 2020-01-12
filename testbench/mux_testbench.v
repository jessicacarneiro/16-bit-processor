`include "src/mux.v"

module mux_testbench;

reg regRSelect;
reg [15:0] regR;
reg immSelect;
reg [15:0] imm;
reg [2:0]  regSelect;
reg [15:0] reg0;
reg [15:0] reg1;
reg [15:0] reg2;
reg [15:0] reg3;
reg [15:0] reg4;
reg [15:0] reg5;
reg [15:0] reg6;
reg [15:0] reg7;
wire [15:0] outData;

initial $dumpfile("mux_testbench.vcd");
initial $dumpvars(0, mux_testbench);

initial
begin
  #1 reg0 = 0; reg1 = 0; reg2 = 3; reg4 = 5;
  reg5 = 6; reg6 = 15; reg7 = 10; regR = 30;
  imm = 42; regSelect = 2; immSelect = 0; regRSelect = 0;
  #1 regRSelect = 1;
  #1 regRSelect = 0; immSelect = 1;
  #1 immSelect = 0; regSelect = 6;
  #1 regSelect = 3; reg3 = 8;
  #5 $finish;
end

mux m(regSelect, regRSelect, immSelect, imm, regR, reg0,
reg1, reg2, reg3, reg4, reg5, reg6, reg7, outData);

endmodule
