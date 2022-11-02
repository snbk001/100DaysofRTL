//Up down counter
module updowncntr(
                up_down,
                clk,
                reset,
                bin_count
                );

//port declaration
input logic up_down, clk, reset;
output logic [2:0] bin_count;

logic [2:0] reg_count;

always_ff @ (posedge clk)
  begin
    if (reset)
      reg_count <= 0;
    else
      begin
        if (up_down)
          reg_count <= reg_count - 1;
        else
          reg_count <= reg_count + 1;
      end
  end

assign bin_count = reg_count;

endmodule
