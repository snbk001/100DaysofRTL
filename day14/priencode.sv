//Priority encoder
module priencode (
	i_d,
	o_y
	);

input logic [3:0] i_d;
output logic [2:0] o_y;

always_comb
	begin
			casez(i_d)
				4'b0000: o_y = 3'b000;
				4'b0001: o_y = 3'b001;
				4'b001?: o_y = 3'b010;
				4'b01??: o_y = 3'b011;
				4'b1???: o_y = 3'b100;
			endcase
	end

endmodule
