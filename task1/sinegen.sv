module sinegen(
    input logic [7:0] incr,
    input logic rst, en, clk,
    output logic [7:0] dout
);

    logic [7:0] addr;

    counter u_counter(clk, rst, en, incr, addr);
    rom rom(clk, addr, dout);

endmodule
