// Binary to onehot encoding
module bin2onehot #(
	parameter BIN_WIDTH = 4,
	parameter ONE_HOT_WIDTH = 16
	)(
	i_bin,
	o_onehot
	);

input logic [BIN_WIDTH-1 : 0] i_bin;
output logic [ONE_HOT_WIDTH-1 : 0] o_onehot;

assign o_onehot = 1'b1 << i_bin;

endmodule
