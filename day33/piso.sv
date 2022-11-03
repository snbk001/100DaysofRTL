//Parallel in Serial out
module piso 
#(parameter WIDTH = 8)
(
    clk,
    reset,
    load,
    p_in,
    s_out
);

//port declaration
input logic clk;
input logic reset;
input logic load;
input logic [WIDTH - 1 : 0] p_in;
output logic s_out;

logic [WIDTH - 1 : 0] reg_out;

//out logic
always_ff @ (posedge clk)
    begin
        if (reset)
            reg_out <= 0;
        else
            begin
                if (load)
                    reg_out <= p_in;
                else
                    begin
                        s_out <= reg_out[0];
                        reg_out <= {1'b0, reg_out[7:1]};
                    end
            end
    end

endmodule
