//Testbench for Dual(Rising & Falling) edge detector
module dualedge_det_tb ();

logic clk;
logic reset;
logic level;
logic rise_edge_det;
logic fall_edge_det;

dualedge_det dut(
    .clk(clk),
    .reset(reset),
    .level(level),
    .rise_edge_det(rise_edge_det),
    .fall_edge_det(fall_edge_det)
);

// Dump waves	
initial begin
    	$dumpfile("dualedge_det.vcd");
    	$dumpvars(0, dualedge_det_tb);
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
    #20 level = 1'b1;#30;
    level = 1'b0;#45;
    level = 1'b1;#50;
    level = 1'b0;
end

initial begin
	repeat(50)
		begin
			@(posedge clk);
            $display("reset: %0b, level: %0b, rise_edge_det: %0b, fall_edge_det: %0b", reset, level, rise_edge_det, fall_edge_det);
		end
end

//end simulation
initial begin
	#500 $finish;
end

endmodule
