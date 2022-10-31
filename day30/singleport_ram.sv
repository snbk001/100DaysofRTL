//Single port RAM
module singleport_ram
    #(
        parameter ADDR_WIDTH = 2,
                  DATA_WIDTH = 3
               )
    (
        clk,
        we,
        addr,
        i_data,
        o_data
    );

input logic clk;
input logic we;
input logic [ADDR_WIDTH - 1 : 0] addr;
input logic [DATA_WIDTH - 1 : 0] i_data;
output logic [DATA_WIDTH - 1 : 0] o_data;

logic [DATA_WIDTH - 1 : 0] ram_mem [2**ADDR_WIDTH - 1 : 0];

always_ff @( posedge clk ) 
    begin
        if (we)
            ram_mem[addr] <= i_data;
        else
            ram_mem[addr] <= 0;
    end

assign o_data = ram_mem[addr];

endmodule
