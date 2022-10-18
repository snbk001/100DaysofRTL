//Mod-m Counter
module modmcountr 
    #(parameter M = 10) (
        clk,
        reset,
        max_tick,
        o_count
);

//port declaration
input logic clk;
input logic reset;
output logic max_tick;
output logic [$clog2(M)-1 : 0] o_count;

localparam  N = $clog2(M);

logic [N-1 : 0] r_reg;
logic [N-1 : 0] r_next;

always_ff @ (posedge clk, posedge reset)
    begin
        if (reset)
            r_reg <= 0;
        else
            r_reg <= r_next;
    end

//output logic
assign r_next = (r_reg == M-1) ? 0 : r_reg + 1;
assign max_tick = (r_reg == M-1) ? 1'b1 : 1'b0;
assign o_count  = r_reg;

endmodule
