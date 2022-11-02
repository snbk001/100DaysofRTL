//Testbench for Up down counter
module updowncntr_tb();

logic up_down, clk, reset;
logic  [2:0] bin_count;

//instantiation of dut
updowncntr dut (
             .up_down(up_down),
             .clk(clk),
             .reset(reset),
             .bin_count(bin_count)
              );

//clock generation
initial begin
   clk = 0;
   forever #5 clk = ~clk;
end

initial begin
   reset = 1;#25;
   reset = 0;
#200 $finish;
end

always @ (posedge clk)
   begin
      stimulus;
      $display("reset = %b, up_down = %b, bin_count = %b", reset, up_down, bin_count);
   end

task stimulus;
      up_down = $random;@(posedge clk);
endtask

endmodule
