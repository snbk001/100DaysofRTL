//mux design
module mux(
	i_a,
	i_b,
	i_sel,
	o_y
	);

//port declaration	
input i_a;
input i_b;
input i_sel;
output o_y;

//conditional operator for mux
assign o_y = i_sel ? i_b : i_a;

endmodule
