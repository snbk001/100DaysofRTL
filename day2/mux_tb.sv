//testbench for mux
module mux_tb();
	
reg i_a;
reg i_b;
reg i_sel;
wire o_y;

reg out_match;
reg golden_mux;

//module instantiation
mux dut (
	.i_a(i_a),
	.i_b(i_b),
	.i_sel(i_sel),
	.o_y(o_y)
	);

// Dump waves	
initial begin
    	$dumpfile("mux.vcd");
    	$dumpvars(0, mux_tb);
end

initial begin
	repeat (10)
		begin	
			stimulus();
			if (o_y == golden_mux)
				begin
					out_match = 1'b1;
					$display("i_a : %0b, i_b : %0b, i_sel : %0b, o_y = %0b, golden_mux = %0b", i_a, i_b, i_sel, o_y, golden_mux);
				end
			else
				begin
					out_match = 1'b0;
					$display("i_a : %0b, i_b : %0b, i_sel : %0b, o_y = %0b, golden_mux = %0b", i_a, i_b, i_sel, o_y, golden_mux);
				end
		end
end

task stimulus();
	begin
		i_a = $random;#5;
		i_b = $random;#5;
		i_sel = $random;#5;
		
		case (i_sel)
			1'b0: golden_mux = i_a;
			1'b1: golden_mux = i_b;
		endcase
	end
endtask

endmodule
