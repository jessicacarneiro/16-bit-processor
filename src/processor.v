`include "src/alu.v"
`include "src/control_unit.v"
`include "src/counter.v"
`include "src/mux.v"
`include "src/signal_ext.v"

module processor(
  input clock,
  input [15:0] inn,
  input reset,
  output [15:0] bus
  );

// registers in processor
reg [15:0] reg0;
reg [15:0] reg1;
reg [15:0] reg2;
reg [15:0] reg3;
reg [15:0] reg4;
reg [15:0] reg5;
reg [15:0] reg6;
reg [15:0] reg7;
reg [15:0] regA;
reg [15:0] regR;

// wires connecting modules
wire clear;
wire immSelect;
wire regASelect;
wire regRSelect;
wire reg0Select;
wire reg1Select;
wire reg2Select;
wire reg3Select;
wire reg4Select;
wire reg5Select;
wire reg6Select;
wire reg7Select;
wire regAEnable;
wire regREnable;
wire reg0Enable;
wire reg1Enable;
wire reg2Enable;
wire reg3Enable;
wire reg4Enable;
wire reg5Enable;
wire reg6Enable;
wire reg7Enable;
wire [1:0] count;
wire [1:0] opSelect;
wire [2:0] regSelect;
wire [8:0] inn_imm;
wire [15:0] imm;
wire [15:0] outdata;
wire [15:0] outdata_alu;

// outdata wire will be connected to bus
assign bus = outdata;

// assigning immediate part of inn to wire
assign inn_imm = inn [8:0];


always @(posedge clock) begin
  if (regREnable) begin
    regR <= outdata_alu;
  end

  if (regAEnable) begin
    regA <= outdata;
  end

  if (reg0Enable) begin
    reg0 <= outdata;
  end

  if (reg1Enable) begin
    reg1 <= outdata;
  end

  if (reg2Enable) begin
    reg2 <= outdata;
  end

  if (reg3Enable) begin
    reg3 <= outdata;
  end

  if (reg4Enable) begin
    reg4 <= outdata;
  end

  if (reg5Enable) begin
    reg5 <= outdata;
  end

  if (reg6Enable) begin
    reg6 <= outdata;
  end

  if (reg7Enable) begin
    reg7 <= outdata;
  end
end

// modules connected
alu a(regA, outdata, opSelect, outdata_alu);
counter c(clock, clear, count);
mux m(regSelect, regRSelect, immSelect, imm, regR, reg0, reg1, reg2,
  reg3, reg4, reg5, reg6, reg7, outdata);
signal_ext se(inn_imm, imm);
control_unit cu(count, reset, inn, clear, opSelect, immSelect, regRSelect, regASelect,
  reg0Select, reg1Select, reg2Select, reg3Select, reg4Select, reg5Select,
  reg6Select, reg7Select, regREnable, regAEnable, reg0Enable, reg1Enable,
  reg2Enable, reg3Enable, reg4Enable, reg5Enable, reg6Enable, reg7Enable);

endmodule