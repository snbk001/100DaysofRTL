//Testbench for Sequential Multiplier
module seqmultiplier_tb();

logic [ 7:0] i_a;
logic [ 7:0] i_b;
logic clk;
logic load;
logic reset;
logic out_valid;
logic [15:0] out_prod;

//instantiation of the design under the test
seqmultiplier dut(
            .i_a(i_a),
            .i_b(i_b),
            .clk(clk),
            .load(load),
            .reset(reset),
            .out_valid(out_valid),
            .out_prod(out_prod)
             ); 

//clock generation
initial begin
   clk = 1'b0;
   forever #5 clk = ~clk;
end
  
// Dump waves	
initial begin
    $dumpfile("seqmultiplier.vcd");
    $dumpvars(0, seqmultiplier_tb);
end

initial begin
   reset       = 1;
   load        = 1;
   #20 reset   = 0;
   #200 $finish;
end
initial begin
   stimulus;#40;
   $display("input a = %d, input b = %d, design output = %d", i_a, i_b, out_prod);
end

task stimulus;
   begin
      i_a = $random;
      i_b = $random;
   end
endtask

endmodule
