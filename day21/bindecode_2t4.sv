//2 to 4 binary decoder
module bindecode_2t4 (
    i_a,
    en,
    o_y
);

input logic [1:0] i_a;
input logic en;
output logic [3:0] o_y;

always_comb
    begin
        if (~en)
            o_y = 4'b0000;
        else
            begin
                case(i_a)
                    2'b00: o_y = 4'b0001;
                    2'b01: o_y = 4'b0010;
                    2'b10: o_y = 4'b0100;
                    2'b11: o_y = 4'b1000;
                    default: o_y = 4'b0000;
                endcase
            end
    end
    
endmodule
