//positive edge detection
module pedge (
	clk,
	i_sig,
	o_pe
	);
	
input logic clk;
input logic i_sig;
output logic o_pe;

logic delay_sig;

always_ff @ (posedge clk)
	begin
		delay_sig <= i_sig;
	end
	
assign o_pe = i_sig & ~delay_sig;

endmodule
