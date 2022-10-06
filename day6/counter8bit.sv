//8bit counter
module counter8bit(
	clk,
	reset,
	o_count
	);
	
//port declaration
input logic clk;
input logic reset;
output logic [7:0] o_count;

always_ff @ (posedge clk)
	begin
		if (reset)
			o_count <= 8'b0;
		else 
			begin
				if (o_count < 8'b11111111)
					o_count <= o_count + 1'b1;
				else
					o_count <= 8'b0;
			end
	end
endmodule
