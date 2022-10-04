module fullsub(
	i_a,
	i_b,
	i_c,
	o_diff,
	o_borrow
	);
	
input i_a;
input i_b;
input i_c;
output o_diff;
output o_borrow;
wire w1, w2, w3;

halfsub hs1 (
	.i_ha(i_a),
	.i_hb(i_b),
	.o_hdiff(w1),
	.o_hborrow(w2)
	);
	
halfsub hs2 (
	.i_ha(w1),
	.i_hb(i_c),
	.o_hdiff(o_diff),
	.o_hborrow(w3)
	);
	
assign o_borrow = w2 | w3;

endmodule
