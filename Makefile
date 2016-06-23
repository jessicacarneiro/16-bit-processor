test:
	iverilog testbench/$(file)_testbench.v
	vvp a.out
	gtkwave $(file)_testbench.vcd

clean:
	rm *.out *.vcd
