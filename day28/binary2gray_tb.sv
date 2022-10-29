//Testbench for Binary to Gray Converter
module binary2gray_tb();

parameter  N = 8;
logic [N-1:0] binary;
logic [N-1:0] gray;

//instantiation of design under test
binary2gray #(.N(8)) dut (
                     .binary(binary),
                     .gray(gray)
                     );

initial begin
   repeat(10)
      begin
         stimulus;
         $display("input binary = %b, output gray = %b", binary, gray);
      end
end

task stimulus;
   begin 
      binary = $urandom_range(0, 255);#5;
   end
endtask

endmodule 
