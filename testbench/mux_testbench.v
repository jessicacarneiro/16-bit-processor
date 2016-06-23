`include "src/mux.v"

module mux_testbench;

reg [2:0]  regSelect;
reg [15:0] regBank [2:0];
reg rSelect;
reg [15:0] regR;
reg immSelect;
reg [15:0] imm;
wire [15:0] outData;

initial $dumpfile("mux_testbench.vcd");
initial $dumpvars(0, mux_testbench);

initial
begin
  #5 $finish;
end

mux m(regSelect, regBank, rSelect, regR, immSelect, imm, outData);

endmodule
