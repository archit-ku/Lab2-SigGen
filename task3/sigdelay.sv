module sigdelay(
    input logic clk,
    input logic rst,
    input logic wr,
    
    input logic [8:0] offset,
    input logic [7:0] mic_signal,

    output logic [7:0] delayed_signal
);
    localparam ADDRESS_WIDTH = 9;
    localparam DATA_WIDTH = 8;
    
    logic [ADDRESS_WIDTH-1:0] w_addr;
    logic [ADDRESS_WIDTH-1:0] r_addr;

    counter #(.WIDTH(ADDRESS_WIDTH)) u_counter (
        .clk(clk),
        .rst(rst),
        .en(wr),
        .incr(1),
        .count(w_addr)
    );

    assign r_addr = w_addr - offset; 
    
    dp_ram #(.ADDRESS_WIDTH(ADDRESS_WIDTH), .DATA_WIDTH(DATA_WIDTH)) u_ram (
        .clk(clk),
        .rst(rst),
        .wr_en(wr),
        .w_addr(w_addr),
        .w_data(mic_signal),
        
        .r_addr(r_addr),
        .r_data(delayed_signal)
    );

endmodule
