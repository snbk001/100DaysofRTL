//testbench for positive edge
module pedge_tb();

logic clk;
logic i_sig;
wire o_pe;

//module instantiation
pedge dut (
	.clk(clk),
	.i_sig(i_sig),
	.o_pe(o_pe)
	);

// Dump waves	
initial begin
    	$dumpfile("pedge.vcd");
    	$dumpvars(0, pedge_tb);
end

//clock generation and signal initialisation
initial begin
	i_sig = 1'b0;
	clk = 1'b0;
	forever #5 clk = ~clk;
end

//input signal
initial begin
	#15 i_sig = 1'b0;
	#20 i_sig = 1'b1;
	#15 i_sig = 1'b0;
	#10 i_sig = 1'b1;
end

//end of simulation
initial begin
	#200 $finish();
end

endmodule
