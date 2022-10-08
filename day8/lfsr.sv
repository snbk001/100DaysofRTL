// Linear Feedback Shift Register
module lfsr (
	clk,
	reset,
	o_lfsr
	);
	
input logic clk;
input logic reset;
output logic [3:0] o_lfsr;

logic feedback;
logic [3:0] next_state;
logic [3:0] str_lfsr;

always_ff @ (posedge clk)
	begin
		if (reset)
			str_lfsr <= 4'b0;
		else
			str_lfsr <= next_state;
	end

assign feedback = ~(o_lfsr[1] ^ o_lfsr[3]);
assign next_state = {o_lfsr[2:0], feedback};
assign o_lfsr = str_lfsr;
	
endmodule
