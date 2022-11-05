//Testbench for Serial in Parallel out
module sipo_tb ();
    parameter WIDTH = 8;
    
    logic clk;
    logic reset;
    logic  s_in;
    logic [WIDTH - 1 : 0] p_out;
    

sipo #(.WIDTH(WIDTH)) dut (
    .clk(clk),
    .reset(reset),
    .s_in(s_in),
    .p_out(p_out)
);

// Dump waves	
initial begin
    	$dumpfile("sipo.vcd");
    	$dumpvars(0, sipo_tb);
end

//clock generation
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

//reset initialization
initial begin
    reset = 1'b1;#10;
    #15 reset = 1'b0;
    @(posedge clk) s_in = 1'b1;
    @(posedge clk) s_in = 1'b1;
    @(posedge clk) s_in = 1'b0;
    @(posedge clk) s_in = 1'b1;
    @(posedge clk) s_in = 1'b0;
    @(posedge clk) s_in = 1'b0;
    @(posedge clk) s_in = 1'b1;
    @(posedge clk) s_in = 1'b0;@(posedge clk);
    @(posedge clk) $finish;
end

endmodule
