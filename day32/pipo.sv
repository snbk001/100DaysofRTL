//Parallel in parallel out
module pipo 
#(parameter WIDTH = 4)
(
    clk,
    reset,
    p_in,
    p_out
);

//port declaration
input logic clk;
input logic reset;
input logic [WIDTH - 1 : 0] p_in;
output logic [WIDTH - 1 : 0] p_out;

logic [WIDTH - 1 : 0] reg_out;

//out logic
always_ff @ (posedge clk)
    begin
        if (reset)
            reg_out <= 0;
        else
            reg_out <= p_in;
    end

assign p_out = reg_out;

endmodule
