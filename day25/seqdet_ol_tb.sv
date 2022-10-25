//Testbench for Sequence Detector 1101 mealy overlap
module seqdet_ol_tb();

    logic clk;
    logic reset;
    logic i_data;
    logic o_det;

seqdet_ol dut (
    .clk(clk),
    .reset(reset),
    .i_data(i_data),
    .o_det(o_det)
);

// Dump waves	
initial begin
    	$dumpfile("seqdet_ol.vcd");
    	$dumpvars(0, seqdet_ol_tb);
end

//clock generation
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

//reset initialization
initial begin
	reset = 1'b1;@(posedge clk);
	reset = 1'b0;
end

initial begin
    repeat(20)
        begin
            stimulus;
            $display("reset: %0b, i_data = %b, o_det = %b", reset, i_data, o_det);
        end
end
  
task stimulus;
  begin
    i_data = $random;@(posedge clk); 
  end
endtask

//end simulation
initial begin
	#300 $finish;
end

endmodule
