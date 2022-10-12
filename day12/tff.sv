//t flip flop using jk flip flop
`include "jkff.sv"
module tff(
	clk,
	reset,
	i_t,
	o_q
	);
	
input logic clk;
input logic reset;
input logic i_t;
output logic o_q;

jkff jk1 (
	.clk(clk),
	.reset(reset),
	.i_j(i_t),
	.i_k(i_t),
	.o_q(o_q)
	);
	
endmodule
