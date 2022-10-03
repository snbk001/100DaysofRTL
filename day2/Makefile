PROG = mux
TIME = $$(date +'%Y%m%d-%H%M%S')

TOOLCMD = iverilog -o sim.vvp

help:	
	@echo "Logic Gates"
	
compile: clean
	$(TOOLCMD) -s $(PROG) $(PROG).sv

sim:	clean
	$(TOOLCMD) -s $(PROG)_tb $(PROG).sv $(PROG)_tb.sv
	./sim.vvp
	gtkwave $(PROG).vcd &
		
build: clean
	touch synth.ys
	echo "read -sv $(PROG).sv" > synth.ys
	echo "hierarchy -top $(PROG)" >> synth.ys
	echo "proc; opt; techmap; opt" >> synth.ys
	echo "write_verilog synth.v" >> synth.ys
	echo "show -prefix $(PROG) -colors $(TIME)" >> synth.ys

synth:	build
	yosys synth.ys
	
clean:
	rm -rf sim.vvp synth.ys synth.v $(PROG).dot $(PROG).dot.pid $(PROG).vcd
