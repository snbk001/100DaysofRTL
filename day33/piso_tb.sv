//Testbench for Parallel in Serial out
module piso_tb ();
    parameter WIDTH = 8;
    
    logic clk;
    logic reset;
    logic load;
    logic [WIDTH - 1 : 0] p_in;
    logic s_out;
    

piso #(.WIDTH(WIDTH)) dut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .p_in(p_in),
    .s_out(s_out)
);

// Dump waves	
initial begin
    	$dumpfile("piso.vcd");
    	$dumpvars(0, piso_tb);
end

//clock generation
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

//reset initialization
initial begin
	reset = 1'b1;@(posedge clk);
	reset = 1'b0;#10;
    p_in = 8'b11010010;#10;
    load = 1'b1;#10;
    load = 1'b0;
end

//end simulation
initial begin
	#200 $finish;
end

endmodule
