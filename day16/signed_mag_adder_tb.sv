//Testbench for Signed Magnitude adder
module signed_mag_adder_tb ();

    parameter WIDTH = 4;
	  logic [WIDTH-1:0] i_a;
	  logic [WIDTH-1:0] i_b;
	  logic [WIDTH-1:0] o_sum;

signed_mag_adder #(.WIDTH(4)) dut (
	  .i_a(i_a),
    .i_b(i_b),
	  .o_sum(o_sum)
	);

// Dump waves	
initial begin
    	$dumpfile("signed_mag_adder.vcd");
    	$dumpvars(0, signed_mag_adder_tb);
end

initial begin
	  o_sum = 8'b0;
	  repeat(10)
		begin
		  stimulus();
			$display("i_a: %0b, i_b: %0b, o_sum: %0b", i_a, i_b, o_sum);
		end
end

task stimulus;
	begin
	  i_a = $random;
    i_b = $random;#10;
	end
endtask

endmodule
