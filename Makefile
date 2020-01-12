test:
	iverilog testbench/$(FILE)_testbench.v
	vvp a.out
	gtkwave $(FILE)_testbench.vcd

clean:
	rm *.out *.vcd