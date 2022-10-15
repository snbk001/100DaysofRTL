//Barrel shifter
module barrel_shifter (
	i_data,
	i_shift_amt,
	o_shift_data
	);

input logic [7:0] i_data;
input logic [2:0] i_shift_amt;
output logic [7:0] o_shift_data;

always_comb
	begin
		case(i_shift_amt)
			3'b000: o_shift_data = i_data;
			3'b001: o_shift_data = {i_data[0], i_data[7:1]};
			3'b010: o_shift_data = {i_data[1:0], i_data[7:2]};
			3'b011: o_shift_data = {i_data[2:0], i_data[7:3]};
			3'b100: o_shift_data = {i_data[3:0], i_data[7:4]};
			3'b101: o_shift_data = {i_data[4:0], i_data[7:5]};
			3'b110: o_shift_data = {i_data[5:0], i_data[7:6]};
			3'b111: o_shift_data = {i_data[6:0], i_data[7]};
			default: o_shift_data = i_data;
		endcase
	end

endmodule
