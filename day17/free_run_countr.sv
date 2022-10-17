//Free Running Counter
module free_run_countr 
    #(parameter WIDTH = 8) (
    clk,
    reset,
    sync_clr,
    load,
    en,
    up,
    i_data,
    max_tick,
    min_tick,
    o_count
);

//port declaration
input logic clk;
input logic reset;
input logic sync_clr;
input logic load;
input logic en;
input logic up;
input logic [WIDTH - 1 : 0] i_data;
output logic max_tick;
output logic min_tick;
output logic [WIDTH - 1 : 0] o_count;

//signal declaration
logic [WIDTH - 1 : 0] r_reg;
logic [WIDTH - 1 : 0] r_next;

always_ff @ (posedge clk, negedge reset)
    begin
        if (reset)
            r_reg <= 0;
        else
            r_reg <= r_next;
    end

//logic for next state
always_comb
    begin
        if (sync_clr)
            r_next = 0;
        else if (load)
            r_next = i_data;
        else if (en & up)
            r_next = r_reg + 1;
        else if (en & ~up)
            r_next = r_reg - 1;
        else
            r_next = r_reg;
    end

//out logic
assign o_count = r_reg;
assign max_tick = (r_reg == 2**(WIDTH - 1)) ? 1'b1 : 1'b0;
assign min_tick = (r_reg == 0 ) ? 1'b1 : 1'b0;

endmodule
