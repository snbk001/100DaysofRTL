module fullsub_tb();

reg i_a;
reg i_b;
reg i_c;
wire o_diff;
wire o_borrow;

reg out_match;
reg new_diff;
reg new_borrow;

fullsub dut (
	.i_a(i_a),
	.i_b(i_b),
	.i_c(i_c),
	.o_diff(o_diff),
	.o_borrow(o_borrow)
	);

// Dump waves	
initial begin
    	$dumpfile("fullsub.vcd");
    	$dumpvars(0, fullsub_tb);
end

initial begin
	repeat (10)
		begin	
			stimulus();
			if (o_diff == new_diff && o_borrow == new_borrow)
				begin
					out_match = 1'b1;
					$display("i_a : %0b, i_b : %0b, i_c : %0b, o_diff : %0b, new_diff : %0b, o_borrow : %0b, new_borrow : %0b", i_a, i_b, i_c, o_diff, new_diff, o_borrow, new_borrow);
				end
			else
				begin
					out_match = 1'b0;
					$display("i_a : %0b, i_b : %0b, i_c : %0b, o_diff : %0b, new_diff : %0b, o_borrow : %0b, new_borrow : %0b", i_a, i_b, i_c, o_diff, new_diff, o_borrow, new_borrow);
				end
		end
end

task stimulus();
	begin
		i_a = $random;#5;
		i_b = $random;#5;
		i_c = $random;#5;
		
		new_diff = i_a ^ i_b ^ i_c;
		new_borrow = (~i_a & i_c) | (i_b & i_c) | (~i_a & i_b);
		
	end
endtask
	
endmodule
