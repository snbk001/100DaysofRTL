//Sequential Multiplier
module seqmultiplier(
               i_a,
               i_b,
               clk,
               load,
               reset,
               out_valid,
               out_prod
               ); 

//port declaration
input logic [ 7:0] i_a;
input logic [ 7:0] i_b;
input logic clk;
input logic load;
input logic reset;
output logic out_valid;
output logic [15:0] out_prod;

logic [15:0] p1, p2, p3, p4, p5, p6, p7, p8;
logic [15:0] temp_prod;

assign temp_prod = {8'b0, i_b};

always_ff @ (posedge clk, posedge reset)
   begin
      if (reset)
         begin
            out_prod    <= 16'b0;
            out_valid   <= 1'b0;
         end
      else
         begin
            if (load)
               begin
                  if (i_a[0])
                     p1 <= temp_prod;
                  else
                     p1 <= 8'b0;
                  if (i_a[1])
                     p2 <= temp_prod << 1;
                  else
                     p2 <= 8'b0;
                  if (i_a[2])
                     p3 <= temp_prod << 2;
                  else
                     p3 <= 8'b0;
                  if (i_a[3])
                     p4 <= temp_prod << 3;
                  else
                     p4 <= 8'b0;
                  if (i_a[4])
                     p5 <= temp_prod << 4;
                  else
                     p5 <= 8'b0;
                  if (i_a[5])
                     p6 <= temp_prod << 5;
                  else
                     p6 <= 8'b0;
                  if (i_a[6])
                     p7 <= temp_prod << 6;
                  else
                     p7 <= 8'b0;
                  if (i_a[7])
                     p8 <= temp_prod << 7;
                  else
                     p8 <= 8'b0;
                  out_prod    <=  p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 ;
                  out_valid   <=  1'b1;
               end
         end
   end

endmodule
