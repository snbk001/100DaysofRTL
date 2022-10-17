//Testbench for Free Running Counter
module free_run_countr_tb ();

    logic clk;
    logic reset;
    logic sync_clr;
    logic load;
    logic en;
    logic up;
    logic [WIDTH - 1 : 0] i_data;
    logic max_tick;
    logic min_tick;
    logic [WIDTH - 1 : 0] o_count;

free_run_countr dut (
    .clk(clk),
    .reset(reset),
    .sync_clr(sync_clr),
    .load(load),
    .en(en),
    .up(up),
    .i_data(i_data),
    .max_tick(max_tick),
    .min_tick(min_tick),
    .o_count(o_count)
);

// Dump waves	
initial begin
    	$dumpfile("free_run_countr.vcd");
    	$dumpvars(0, free_run_countr_tb);
end

initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

//reset initialization
initial begin
    i_data = 8'b1;
    en = 1'b1;
    sync_clr = 1'b0;
    up = 1'b1;
    load = 1'b0;
	reset = 1'b1;#20;
    reset = 1'b0;
    
end

initial begin
    #200 up = 1'b0;
end

initial begin
	repeat(50)
		begin
			$display("reset: %0b, i_data: %0b, o_count: %0d", reset, i_data, o_count);@(posedge clk);
		end
end

//end simulation
initial begin
	#500 $finish;
end

endmodule
