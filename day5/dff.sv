//asynchronous dff

module dff(
	clk,
	reset,
	i_d,
	o_q
	);
	
input logic clk;
input logic reset;
input logic i_d;
output logic o_q;

always_ff @ (posedge clk or posedge reset)
	begin
		if (reset)
			o_q <= 1'b0;
		else
			o_q <= i_d;
	end

endmodule
