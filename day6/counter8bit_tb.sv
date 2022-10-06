`timescale 1ns/1ps
module counter8bit_tb();

logic clk;
logic reset;
logic [7:0] o_count;

//dut instantiation
counter8bit dut (
	.clk(clk),
	.reset(reset),
	.o_count(o_count)
	);

//clock generation
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

// Dump waves	
initial begin
    	$dumpfile("counter8bit.vcd");
    	$dumpvars(0, counter8bit_tb);
end

//reset initialization
initial begin
	reset = 1'b1;
	#20 reset = 1'b0;
end

always @ (posedge clk)
  begin
	$display("count : %0d", o_count);
  end

//end simulation
initial begin
	#3000 $finish;
end

endmodule
