module mux
( input  [2:0] regSelect,
  input  [8*15:0] regBank,
  input  rSelect,
  input [15:0] regR,
  input  immSelect,
  input [15:0] imm,
  output [15:0] outData);

reg [15:0] regBank_array [2:0];
reg [15:0] regOut;

genvar i;
generate for(i = 0; i < 16; i = i +1)
  begin
    assign regBank[16*i+:16] = regBank_array[i];
  end
endgenerate

assign outData = regOut;

always @(*) begin
  // Retrieve output from registers bank
  case(regSelect)
    3'b000: regOut <= regBank_array[3'b000];
    3'b001: regOut <= regBank_array[3'b001];
    3'b010: regOut <= regBank_array[3'b010];
    3'b011: regOut <= regBank_array[3'b011];
    3'b100: regOut <= regBank_array[3'b100];
    3'b101: regOut <= regBank_array[3'b101];
    3'b110: regOut <= regBank_array[3'b110];
    3'b111: regOut <= regBank_array[3'b111];
  endcase
  // Retrieve output from R register
  if(rSelect == 1'b1)
    regOut <= regR;
  // Retrieve output from immediate
  if(immSelect == 1'b1)
    regOut <= imm;
end

endmodule
