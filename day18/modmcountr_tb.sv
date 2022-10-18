//Testbench for Mod-m Counter
module modmcountr_tb ();
    parameter M = 10;
    
    logic clk;
    logic reset;
    logic max_tick;
    logic [$clog2(M) : 0] o_count;
    

modmcountr #(.M(M)) dut (
    .clk(clk),
    .reset(reset),
    .max_tick(max_tick),
    .o_count(o_count)
);

// Dump waves	
initial begin
    	$dumpfile("modmcountr.vcd");
    	$dumpvars(0, modmcountr_tb);
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
	repeat(50)
		begin
			@(posedge clk);
            $display("reset: %0b, o_count: %0b", reset, o_count);
		end
end

//end simulation
initial begin
	#500 $finish;
end

endmodule
