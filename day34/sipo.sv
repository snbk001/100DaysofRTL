//Serial in Parallel out
module sipo 
#(parameter WIDTH = 8)
(
    clk,
    reset,
    s_in,
    p_out
);

//port declaration
input logic clk;
input logic reset;
input logic s_in;
output logic [WIDTH - 1 : 0] p_out;

//out logic
always_ff @ (posedge clk)
    begin
        if (reset)
            p_out <= 0;
        else
            begin
                p_out <= p_out << 1;
                p_out[0] <= s_in;
            end
    end

endmodule
