//testbench for jk flip flop
module jkff_tb();
	
logic clk;
logic reset;
logic i_j;
logic i_k;
logic o_q;

//module instantiation
jkff dut (
	.clk(clk),
	.reset(reset),
	.i_j(i_j),
	.i_k(i_k),
	.o_q(o_q)
	);

// Dump waves	
initial begin
    	$dumpfile("jkff.vcd");
    	$dumpvars(0, jkff_tb);
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
					#5 $display("reset : %0b, i_j : %0b, i_k : %0b, o_q : %0b", reset, i_j, i_k, o_q);
				end
		end
end

task stimulus();
	begin
		i_j = $random;
		i_k = $random;#5;
	end
endtask

//end simulation
initial begin
	#200 $finish;
end

endmodule
