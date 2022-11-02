//Testbench for Parallel in parallel out
module pipo_tb ();
    parameter WIDTH = 4;
    
    logic clk;
    logic reset;
    logic [WIDTH - 1 : 0] p_in;
    logic [WIDTH - 1 : 0] p_out;
    
pipo #(.WIDTH(WIDTH)) dut (
    .clk(clk),
    .reset(reset),
    .p_in(p_in),
    .p_out(p_out)
);

// Dump waves	
initial begin
    	$dumpfile("pipo.vcd");
    	$dumpvars(0, pipo_tb);
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
	repeat(20)
		begin
      stimulus;
			$display("reset: %0b, p_in: %0b, p_out: %0b", reset, p_in, p_out);@(posedge clk);
		end
end

//task for input 
task stimulus;
      p_in = $random;@(posedge clk);
endtask

//end simulation
initial begin
	#300 $finish;
end

endmodule
