//testbench for t flip flop
module tff_tb2();
	
logic clk;
logic reset;
logic i_t;
logic o_q;

//module instantiation
tff dut (
	.clk(clk),
	.reset(reset),
	.i_t(i_t),
	.o_q(o_q)
	);

// Dump waves	
initial begin
    	$dumpfile("tff.vcd");
    	$dumpvars(0, tff_tb);
end

initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

//reset initialization
initial begin
	reset = 1'b1;
	#20 reset = 1'b0;
end

initial begin
		i_t = 1'b0; #40;
		i_t = 1'b1; #20;
		i_t = 1'b0; #20;
		i_t = 1'b1; #20;
end

//end simulation
initial begin
	#200 $finish;
end

endmodule
