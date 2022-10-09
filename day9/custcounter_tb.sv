module custcounter_tb();

logic clk;
logic reset;
logic [7:0] o_count;

custcounter dut (
	.clk(clk),
	.reset(reset),
	.o_count(o_count)
	);

initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end
  
// Dump waves	
initial begin
    	$dumpfile("custcounter.vcd");
    	$dumpvars(0, custcounter_tb);
end

//reset initialization
initial begin
	reset = 1'b1;@(posedge clk);
	reset = 1'b0;
end

//stimulus
initial begin
	repeat (40) 
		begin	
			$display("reset : %0b, o_count : %0b", reset, o_count);@(posedge clk);
		end
end

//end simulation
initial begin
	#200 $finish;
end

endmodule
