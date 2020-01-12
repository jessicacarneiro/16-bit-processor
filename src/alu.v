module alu
( input  [15:0] rdDataA,
  input  [15:0] rdDataB,
  input  [1:0]  opSelect,
  output [15:0] outData);

reg [15:0] aluResult;

assign outData = aluResult;

always @(*) begin
  case(opSelect)
    2'b00: aluResult <= rdDataA + rdDataB; // add
    2'b01: aluResult <= rdDataA - rdDataB; // sub
    2'b10: aluResult <= !(rdDataA & rdDataB); // nan
    2'b11: aluResult <= rdDataB; // out
  endcase
end

endmodule
