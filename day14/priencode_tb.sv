//Testbench for Priority encoder
module priencode_tb ();

logic [3:0] i_d;
logic [2:0] o_y;

priencode dut (
	.i_d(i_d),
	.o_y(o_y)
	);

// Dump waves	
initial begin
    	$dumpfile("priencode.vcd");
    	$dumpvars(0, priencode_tb);
end

initial begin
	repeat(40)
		begin
			stimulus();
			$display("i_d: %0b, o_y: %0b", i_d, o_y);
		end

end

task stimulus;
	begin
		i_d = $urandom_range(0, 31);#5;
	end
endtask

endmodule
