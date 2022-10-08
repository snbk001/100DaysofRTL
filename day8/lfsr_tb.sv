module lfsr_tb();

logic clk;
logic reset;
logic [3:0] o_lfsr;
int i;

//dut
lfsr dut (
	.clk(clk),
	.reset(reset),
	.o_lfsr(o_lfsr)
	);

//clock generation
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end
  
// Dump waves	
initial begin
    	$dumpfile("lfsr.vcd");
    	$dumpvars(0, lfsr_tb);
end

//reset initialization
initial begin
	reset = 1'b1;@(posedge clk);
	reset = 1'b0;
end

  //display output
initial begin
  for (i=0; i< 32; i++)
    begin	
      @(posedge clk);
      $display("reset : %0b, o_lfsr : %0b", reset, o_lfsr);
    end
end

//end simulation
initial begin
	#200 $finish;
end

endmodule
