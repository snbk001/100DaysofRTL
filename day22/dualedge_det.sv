//Dual(Rising & Falling) edge detector
module dualedge_det (
    clk,
    reset,
    level,
    rise_edge_det,
    fall_edge_det
);

//port declaration
input logic clk;
input logic reset;
input logic level;
output logic rise_edge_det;
output logic fall_edge_det;

//fsm states
typedef enum {zero, one, r_edge, f_edge} state_type;

//signals
state_type state_reg, state_next;

always_ff @( posedge clk ) 
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
        rise_edge_det = 1'b0;
        fall_edge_det = 1'b0;

        case (state_reg)
            zero:
                state_next =  one;

            one:
                begin
                    if (level)
                        state_next =  r_edge;
                    else
                        state_next =  zero;
                end

            r_edge:
                begin
                    fall_edge_det = 1'b0;
                    if (level)
                        rise_edge_det = 1'b1;
                    else
                        rise_edge_det = 1'b0;

                    state_next = f_edge;
                end

            f_edge:
                begin
                    rise_edge_det = 1'b0;
                    if (~level)
                        begin
                            fall_edge_det = 1'b1;
                            state_next = zero;
                        end
                end

            default: state_next = zero;
        endcase
    end

endmodule
