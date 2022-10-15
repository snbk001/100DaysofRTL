//Testbench for Barrel shifter
module barrel_shifter_tb ();

	logic [7:0] i_data;
	logic [2:0] i_shift_amt;
	logic [7:0] o_shift_data;

barrel_shifter dut (
	.i_data(i_data),
	.i_shift_amt(i_shift_amt),
	.o_shift_data(o_shift_data)
	);

// Dump waves	
initial begin
    	$dumpfile("barrel_shifter.vcd");
    	$dumpvars(0, barrel_shifter_tb);
end

initial begin
	o_shift_data = 8'b0;
	repeat(10)
		begin
			stimulus();
			$display("i_data: %0b, i_shift_amt: %0b, o_shift_data: %0b", i_data, i_shift_amt, o_shift_data);
		end
end

task stimulus;
	begin
		i_data = $random;
		i_shift_amt = $urandom_range(0, 7);#5;
	end
endtask

endmodule
