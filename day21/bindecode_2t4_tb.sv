////Testbench for 2 to 4 binary decoder
module bindecode_2t4_tb ();
    
logic [1:0] i_a;
logic en;
logic [3:0] o_y;

bindecode_2t4 dut (
    .i_a(i_a),
    .en(en),
    .o_y(o_y)
);

// Dump waves	
initial begin
    	$dumpfile("bindecode_2t4.vcd");
    	$dumpvars(0, bindecode_2t4_tb);
end

initial begin
    $monitor("en: %0b, i_a: %0b, o_y: %0b", en, i_a, o_y);
    en = 1'b0;#10;
    en = 1'b1;
    i_a = 2'b00;#10;
    i_a = 2'b01;#10;
    i_a = 2'b10;#10;
    i_a = 2'b11;#10;

end

endmodule
