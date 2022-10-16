module signed_mag_adder 
    #(parameter WIDTH = 4)(
    i_a,
    i_b,
    o_sum
);

input logic [WIDTH-1 : 0] i_a;
input logic [WIDTH-1 : 0] i_b;
output logic [WIDTH-1 : 0] o_sum;

logic [WIDTH-2 : 0] mag_a;
logic [WIDTH-2 : 0] mag_b;
logic [WIDTH-2 : 0] mag_sum;
logic [WIDTH-2 : 0] max;
logic [WIDTH-2 : 0] min;

logic sign_a;
logic sign_b;
logic sign_sum;

always_comb
    begin
        mag_a = i_a[WIDTH-2 : 0];
        mag_b = i_b[WIDTH-2 : 0];
        sign_a = i_a[WIDTH-1];
        sign_b = i_b[WIDTH-1];

        if (mag_a > mag_b)
            begin
                max = mag_a;
                min = mag_b;
                sign_sum = sign_a;
            end
        else
            begin
                max = mag_b;
                min = mag_a;
                sign_sum = sign_b;
            end
        
        if (sign_a == sign_b)
            mag_sum = max + min;
        else
            mag_sum = max - min;
        
        o_sum = {sign_sum, mag_sum};
    end

endmodule
