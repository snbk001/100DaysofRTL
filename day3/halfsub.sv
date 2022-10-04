module halfsub(
	i_ha,
	i_hb,
	o_hdiff,
	o_hborrow
	);

input i_ha;
input i_hb;
output o_hdiff;
output o_hborrow;

assign o_hdiff = i_ha ^ i_hb;
assign o_hborrow = ~i_ha & i_hb;

endmodule
