module mux
( input  [2:0] regSelect,
  input  regRSelect,
  input  immSelect,
  input [15:0] imm,
  input [15:0] regR,
  input [15:0] reg0,
  input [15:0] reg1,
  input [15:0] reg2,
  input [15:0] reg3,
  input [15:0] reg4,
  input [15:0] reg5,
  input [15:0] reg6,
  input [15:0] reg7,
  output [15:0] outData);

reg [15:0] regOut;

assign outData = regOut;

always @(*) begin
  // Retrieve output from registers bank
  case(regSelect)
    3'b000: regOut <= reg0;
    3'b001: regOut <= reg1;
    3'b010: regOut <= reg2;
    3'b011: regOut <= reg3;
    3'b100: regOut <= reg4;
    3'b101: regOut <= reg5;
    3'b110: regOut <= reg6;
    3'b111: regOut <= reg7;
  endcase
  // Retrieve output from R register
  if(regRSelect == 1'b1)
    regOut <= regR;
  // Retrieve output from immediate
  if(immSelect == 1'b1)
    regOut <= imm;
end

endmodule
