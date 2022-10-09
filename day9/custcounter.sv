//Add 5 in 1st cycle & subtract 2 in next cycle & repeat
module custcounter (
	clk,
	reset,
	o_count
	);
	
input logic clk;
input logic reset;
output logic [7:0] o_count;

logic [7:0] tmp_count;;

always @ (posedge clk)
	begin
		if (reset)
			begin
				tmp_count <= 8'b0;
				o_count <= 8'b0; 
			end
		else
			begin
				tmp_count <= tmp_count + 1;
				if (tmp_count % 2 == 0)
					o_count <= o_count + 5;
				else
					o_count <= o_count - 2;
			end
	end

endmodule
