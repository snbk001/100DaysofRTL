module encoder(
	en,
	i_y,
	o_a
	);

input en;	
input [3:0] i_y;
output reg [1:0] o_a;

always @ (en or i_y) begin
	if (en)
		begin
			if (i_y == 4'b0001)
				o_a = 2'b00;
			else if (i_y == 4'b0010)	
				o_a = 2'b01;
			else if (i_y == 4'b0100)	
				o_a = 2'b10;
			else if (i_y == 4'b1000)	
				o_a = 2'b11;
			else
				o_a = 2'b00;
		end
	else
		o_a = 2'b00;
	end
	
endmodule
