//Testbench for Edge Detector with Moore
module edgedet_moore_tb ();

logic clk;
logic reset;
logic i_level;
logic o_tick;

edgedet_moore dut(
    .clk(clk),
    .reset(reset),
    .i_level(i_level),
    .o_tick(o_tick)
);

// Dump waves	
initial begin
    	$dumpfile("edgedet_moore.vcd");
    	$dumpvars(0, edgedet_moore_tb);
end

//clock generation
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

//reset initialization
initial begin
	reset = 1'b1;@(posedge clk);
	reset = 1'b0;
end

initial begin
    #20 i_level = 1'b1;#30;
    i_level = 1'b0;#40;
    i_level = 1'b1;#50;
    i_level = 1'b0;
end

initial begin
	repeat(50)
		begin
			@(posedge clk);
            $display("reset: %0b, i_level: %0b, o_tick: %0b", reset, i_level, o_tick);
		end
end

//end simulation
initial begin
	#500 $finish;
end

endmodule
