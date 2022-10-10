//testbench for mux using case statement
module muxcond_tb();
	
logic [3:0] i_data0;
logic [3:0] i_data1;
logic [3:0] i_data2;
logic [3:0] i_data3;
logic [1:0] i_sel;
logic [3:0] o_y;

//module instantiation
muxcond dut (
	.i_data0(i_data0),
	.i_data1(i_data1),
	.i_data2(i_data2),
	.i_data3(i_data3),
	.i_sel(i_sel),
	.o_y(o_y)
	);

// Dump waves	
initial begin
    	$dumpfile("muxcond.vcd");
    	$dumpvars(0, muxcond_tb);
end

initial begin
	repeat (10)
		begin	
			stimulus();
				begin
					$display("i_data0 : %0b, i_data1 : %0b, i_data2 : %0b, i_data3 : %0b, i_sel : %0b, o_y = %0b", i_data0, i_data1, i_data2, i_data3, i_sel, o_y);
				end
		end
end

task stimulus();
	begin
		i_data0 = $urandom_range(0, 31);
		i_data1 = $urandom_range(0, 31);
		i_data2 = $urandom_range(0, 31);
		i_data3 = $urandom_range(0, 31);
		i_sel = $urandom_range(0,3);#5;
	end
endtask

//end simulation
initial begin
	#500 $finish;
end

endmodule
