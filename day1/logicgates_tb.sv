module logicgates_tb();

reg i_a;
reg i_b;
wire o_and;
wire o_or;
wire o_xor;

logicgates dut (
	.i_a(i_a),
	.i_b(i_b),
	.o_and(o_and),
	.o_or(o_or),
	.o_xor(o_xor)
	);
	
initial begin
	// Dump waves
    	$dumpfile("logicgates.vcd");
    	$dumpvars(0, logicgates_tb);	
end

initial begin
	repeat(20)
		begin
			stimulus();
			$display("i_a : %0b, i_b : %0b, o_and : %0b, o_or : %0b, o_xor : %0b", i_a, i_b, o_and, o_or, o_xor);
		end
end

task stimulus();
	begin
		i_a = $random;#5;
		i_b = $random;#5;
	end
endtask

endmodule
