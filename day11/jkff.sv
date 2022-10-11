//jk flip flop
module jkff(
	clk,
	reset,
	i_j,
	i_k,
	o_q
	);
	
input logic clk;
input logic reset;
input logic i_j;
input logic i_k;
output logic o_q;

always_ff @ (posedge clk or negedge reset)
	begin
		if (reset)
			o_q <= 1'b0;
		else
			o_q <= (i_j & ~o_q) | (~i_k & o_q);
	end
	
endmodule
