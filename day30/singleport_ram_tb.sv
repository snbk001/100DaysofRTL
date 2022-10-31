//Testbench for Single port RAM
module singleport_ram_tb();

    parameter ADDR_WIDTH = 2;
    parameter DATA_WIDTH = 3;

    logic clk;
    logic we;
    logic [ADDR_WIDTH - 1 : 0] addr;
    logic [DATA_WIDTH - 1 : 0] i_data;
    logic [DATA_WIDTH - 1 : 0] o_data;

singleport_ram #(
                    .ADDR_WIDTH(2),
                    .DATA_WIDTH(3)
               )
               dut (
                .clk(clk),
                .we(we),
                .addr(addr),
                .i_data(i_data),
                .o_data(o_data)
                );

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    repeat(10)
    stimulus;
    #5 $display("addr = %b, data in = %b, write_en = %b, data out = %b", addr, i_data, we, o_data);
end

task stimulus;
    begin
        i_data = $random;
        addr = $random;
    end
endtask

initial begin 
    we = 0;
    #15 we = 1; 
    #200 $finish;   
end

endmodule
