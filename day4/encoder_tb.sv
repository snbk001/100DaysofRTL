module encoder_tb();

reg en;
reg [3:0 ] i_y;
wire [1:0] o_a;

encoder dut (
	.en(en),
	.i_y(i_y),
	.o_a(o_a)
	);

// Dump waves	
initial begin
    	$dumpfile("encoder.vcd");
    	$dumpvars(0, encoder_tb);
end

initial begin
	repeat (10)
		begin	
			stimulus();
				begin
					$display("en : %0b, i_y : %0b, o_a : %0b", en, i_y, o_a);
				end
		end
end

task stimulus();
	begin
		en  = $random;#5;
		i_y = $random;#5;
	end		
endtask

endmodule
