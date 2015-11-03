module register_file
( input clk,
  input reset,
  input write,
  input [2:0] wrAddr,
  input [15:0] wrData,
  input [2:0] rdAddrA,
  output [15:0] rdDataA,
  input [2:0] rdAddrB,
  output [15:0] rdDataB);

reg [15:0] 	 regfile [0:7];

assign rdDataA = regfile[rdAddrA];
assign rdDataB = regfile[rdAddrB];

integer 	 i;
always @(posedge clk) begin
  if (reset) begin
    for (i = 0; i < 8; i = i + 1) begin
      regfile[i] <= 0;
    end
  end else begin
    if (write) regfile[wrAddr] <= wrData;
  end // else: !if(reset)
end
endmodule
