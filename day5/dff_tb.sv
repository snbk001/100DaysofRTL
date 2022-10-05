module dff_tb();

logic clk;
logic reset;
logic i_d;
logic o_q;

//dut instantiation
dff dut (
	.clk(clk),
	.reset(reset),
	.i_d(i_d),
	.o_q(o_q)
	);

//clock generation
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

// Dump waves	
initial begin
    	$dumpfile("dff.vcd");
    	$dumpvars(0, dff_tb);
end

//reset initialization
initial begin
	reset = 1'b1;
	#20 reset = 1'b0;
end

//stimulus
initial begin
	repeat (10) 
		begin	
			stimulus();
				begin
					$display("reset : %0b, i_d : %0b, o_q : %0b", reset, i_d, o_q);
				end
		end
end

//task for stimulus
task stimulus();
	begin
		i_d = $random;@(posedge clk);
	end		
endtask

//end simulation
initial begin
	#200 $finish;
end

endmodule
