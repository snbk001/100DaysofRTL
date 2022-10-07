module bin2onehot_tb();

localparam BIN_WIDTH = 4;
localparam ONE_HOT_WIDTH =16;

logic [BIN_WIDTH-1 : 0] i_bin;
logic [ONE_HOT_WIDTH-1 : 0] o_onehot;

bin2onehot #(
	BIN_WIDTH,
  ONE_HOT_WIDTH) dut (
	.i_bin(i_bin),
	.o_onehot(o_onehot)
	);
	
// Dump waves	
initial begin
    	$dumpfile("bin2onehot.vcd");
    	$dumpvars(0, bin2onehot_tb);
end

//stimulus
initial begin
	repeat (40) 
		begin	
			stimulus();
				begin
					$display("i_bin : %0b, o_onehot : %0b", i_bin, o_onehot);
				end
		end
end

//task for stimulus
task stimulus();
	begin
    i_bin = $urandom_range(0, 31);#5;
	end		
endtask

endmodule
