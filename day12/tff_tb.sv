//testbench for t flip flop with task
module tff_tb();
	
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
	repeat (20)
		begin	
			stimulus();
				begin
					#5 $display("reset : %0b, i_t : %0b, o_q : %0b", reset, i_t, o_q);
				end
		end
end

task stimulus();
	begin
		i_t = $random;#5;
	end
endtask

//end simulation
initial begin
	#200 $finish;
end

endmodule
