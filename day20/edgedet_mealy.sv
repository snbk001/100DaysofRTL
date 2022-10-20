//Edge Detector with Mealy
module edgedet_mealy (
    clk,
    reset,
    i_level,
    o_tick
);

input logic clk;
input logic reset;
input logic i_level;
output logic o_tick;

//fsm states
typedef enum {zero, one} state_type;

//signals
state_type state_reg, state_next;

always_ff @(posedge clk, posedge reset)
    begin
        if (reset)
            state_reg <= zero;
        else
            state_reg <= state_next;
    end

//next state logic
always_comb
    begin
        state_next = state_reg;
        o_tick = 1'b0;

        case (state_reg)
            zero: 
                if (i_level)
                    begin
                        o_tick = 1'b1;
                        state_next = one;
                    end
            one:
                if (~i_level)
                    state_next = zero;
            
            default: state_next = zero;
        
        endcase
    end

endmodule
