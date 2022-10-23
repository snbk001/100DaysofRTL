//Testbench for alu
module alu_tb();  
    logic [3:0]a, b;  
    logic [1:0]select;  
    logic [3:0]out; 
    logic zero, carry, sign, parity, overflow;   

// Dump waves	
initial begin
    	$dumpfile("alu.vcd");
    	$dumpvars(0, alu_tb);
end

// instantiation
alu dut (
         .a(a)              ,  
         .b(b)              ,  
         .select(select)    ,  
         .zero(zero)        ,  
         .carry(carry)      ,  
         .sign(sign)        ,  
         .parity(parity)    ,  
         .overflow(overflow),  
         .out(out)             
          )                 ;

//display
initial begin
   repeat(200)
      begin
         stimulus();#5;
            $display("a = %b, b = %b, select = %b, out = %b, zero = %b, carry = %b, sign = %b, parity = %b, overflow = %b", a, b, select, out, zero, carry, sign, parity, overflow);
      end

end

//input
task stimulus; 
    begin
        a        = $random;
        b        = $random;
        select   = $random;
    end
endtask

endmodule
