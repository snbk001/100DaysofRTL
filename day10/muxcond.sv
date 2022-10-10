//multiplexer using case statement
module muxcond(
	i_data0,
	i_data1,
	i_data2,
	i_data3,
	i_sel,
	o_y
	);

//port declaration	
input logic [3:0] i_data0;
input logic [3:0] i_data1;
input logic [3:0] i_data2;
input logic [3:0] i_data3;
input logic [1:0] i_sel;
output logic [3:0] o_y;

//conditional operator for mux
always_comb 
	begin
		case(i_sel)
			2'b00 : o_y <= i_data0;
			2'b01 : o_y <= i_data1;
			2'b10 : o_y <= i_data2;
			2'b11 : o_y <= i_data3;
		endcase
	end
	
endmodule
