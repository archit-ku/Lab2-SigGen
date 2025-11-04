module sinegen(
    input logic [7:0] incr, OFFSET,
    input logic rst, en, clk,
    output logic [7:0] dout1, dout2
);
    logic [7:0] addr1;
    logic [7:0] addr2;

    assign addr2 = addr1 + OFFSET;

    counter u_counter(clk, rst, en, incr, addr1);
    rom rom(clk, addr1, addr2, dout1, dout2);

endmodule
