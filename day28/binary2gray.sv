//Binary to Gray Converter
module binary2gray #(parameter N = 8)
               (
               binary,
               gray
               );

//port declaration
input logic [N-1:0] binary;
output logic [N-1:0] gray;

//output logic
always_comb
   begin
      gray[N-1] = binary[N-1];
      gray[N-2:0] = binary[N-1:1] ^ binary[N-2:0];
   end

endmodule
