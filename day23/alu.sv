//ALU
module alu(
           a,  
           b, 
           select, 
           zero,  
           carry, 
           sign, 
           parity,  
           overflow,  
           out          
           );

//port declaration
input logic [3:0]a;
input logic [3:0]b;
input logic [1:0]select;
output logic [3:0]out;
output logic zero, carry, sign, parity, overflow;

//output logic
always_comb
   begin
      case (select)
         2'b00 : {carry, out} = a + b;
         2'b01 : {carry, out} = a - b;
         2'b10 : {carry, out} = a * b;
         2'b11 : {carry, out} = a / b;
      endcase

      zero     =  ~|out;
      sign     =  out[3];
      parity   =  ~^out;
      overflow =  (a[3] & b[3] & ~out[3]) | (~a[3] & ~b[3] & out[3]);
   end
 
endmodule
