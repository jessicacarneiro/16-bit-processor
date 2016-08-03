module control_unit(
input [1:0] counter,
input reset,
input [15:0] inn,
output clear,
output [1:0] opSelect,
output immSelect,
output regRSelect,
output regASelect,
output reg0Select,
output reg1Select,
output reg2Select,
output reg3Select,
output reg4Select,
output reg5Select,
output reg6Select,
output reg7Select,
output regREnable,
output regAEnable,
output reg0Enable,
output reg1Enable,
output reg2Enable,
output reg3Enable,
output reg4Enable,
output reg5Enable,
output reg6Enable,
output reg7Enable
);


reg clear;
reg [1:0] opSelect;
reg immSelect;
reg regRSelect;
reg regASelect;
reg reg0Select;
reg reg1Select;
reg reg2Select;
reg reg3Select;
reg reg4Select;
reg reg5Select;
reg reg6Select;
reg reg7Select;
reg regREnable;
reg regAEnable;
reg reg0Enable;
reg reg1Enable;
reg reg2Enable;
reg reg3Enable;
reg reg4Enable;
reg reg5Enable;
reg reg6Enable;
reg reg7Enable;

// auxiliary
reg [2:0] firstReg;
reg [2:0] secondReg;
reg [2:0] instruction;

always @(counter or reset) begin

	if(reset) begin
		clear <= 1; // reset counter

		// reseting all output write signals
		regAEnable <= 0;
		reg0Enable <= 0;
		reg1Enable <= 0;
		reg2Enable <= 0;
		reg3Enable <= 0;
		reg4Enable <= 0;
		reg5Enable <= 0;
		reg6Enable <= 0;
		reg7Enable <= 0;
	end // end reset == 1

	else begin
		clear <= 0;
		case(counter)
		2'b00: begin // 1st cycle: instruction identification
			
			// unselecting all registers
			reg0Enable <= 0;
			reg1Enable <= 0;
			reg2Enable <= 0;
			reg3Enable <= 0;
			reg4Enable <= 0;
			reg5Enable <= 0;
			reg6Enable <= 0;
			reg7Enable <= 0;

			instruction <= inn[8:6];
			case(instruction) // select ALU opcode
				3'b000: opSelect <= 2'b00;
				3'b001: opSelect <= 2'b01;
				3'b010: opSelect <= 2'b10;
				3'b100: opSelect <= 2'b11;
				3'b101: opSelect <= 2'b11;
				3'b111: opSelect <= 2'b11;
			endcase
		end // end counter == 0

		2'b01: begin // 2nd cycle: 1st reg identified

			firstReg <= inn[5:3];
			case(firstReg) // select 1st reg0-7 to be written in regA
				3'b000: reg0Select <= 1;
				3'b001: reg1Select <= 1;
				3'b010: reg2Select <= 1;
				3'b011: reg3Select <= 1;
				3'b100: reg4Select <= 1;
				3'b101: reg5Select <= 1;
				3'b110: reg6Select <= 1;
				3'b111: reg7Select <= 1;
			endcase
			regAEnable <= 1;
		end // end counter == 1

		2'b10: begin // 3rd cycle: 2nd reg identified
			secondReg <= inn[2:0];

			// unselecting all registers
			reg0Select <= 0;
			reg1Select <= 0;
			reg2Select <= 0;
			reg3Select <= 0;
			reg4Select <= 0;
			reg5Select <= 0;
			reg6Select <= 0;
			reg7Select <= 0;

			case(secondReg) // select 2st reg0-7 to be sent to ALU
				3'b000: reg0Select <= 1;
				3'b001: reg1Select <= 1;
				3'b010: reg2Select <= 1;
				3'b011: reg3Select <= 1;
				3'b100: reg4Select <= 1;
				3'b101: reg5Select <= 1;
				3'b110: reg6Select <= 1;
				3'b111: reg7Select <= 1;
			endcase
			regREnable <= 1;
			regAEnable <= 0;
		end // end counter == 2

		2'b11: begin // 4th cycle: 

			// unselecting all registers
			reg0Select <= 0;
			reg1Select <= 0;
			reg2Select <= 0;
			reg3Select <= 0;
			reg4Select <= 0;
			reg5Select <= 0;
			reg6Select <= 0;
			reg7Select <= 0;

			firstReg <= inn[5:3];
			case(firstReg) // enable write in 1st reg0-7 to save result
				3'b000: reg0Enable <= 1;
				3'b001: reg1Enable <= 1;
				3'b010: reg2Enable <= 1;
				3'b011: reg3Enable <= 1;
				3'b100: reg4Enable <= 1;
				3'b101: reg5Enable <= 1;
				3'b110: reg6Enable <= 1;
				3'b111: reg7Enable <= 1;
			endcase
			regREnable <= 0;
		end // end counter == 3
	endcase // end case(counter) block
end // end else block
end // end always block

endmodule