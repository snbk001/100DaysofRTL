module logicgates(
	i_a,
	i_b,
	o_and,
	o_or,
	o_xor
	);
	
input i_a;
input i_b;
output o_and;
output o_or;
output o_xor;

assign o_and = i_a & i_b;
assign o_or  = i_a | i_b;
assign o_xor = i_a ^ i_b;

endmodule
