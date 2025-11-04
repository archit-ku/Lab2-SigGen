module dp_ram #(
    parameter ADDRESS_WIDTH = 9,
    parameter DATA_WIDTH = 8
)(
    input logic clk,
    input logic rst,
    input logic wr_en,
    input logic [ADDRESS_WIDTH-1:0] w_addr,
    input logic [DATA_WIDTH-1:0] w_data,

    input logic [ADDRESS_WIDTH-1:0] r_addr,
    output logic [DATA_WIDTH-1:0] r_data
);
    logic [DATA_WIDTH-1:0] ram_array [0:2**ADDRESS_WIDTH - 1];

    always_ff @(posedge clk) begin
        if (rst) begin
            // RAM reset is optional here
        end else if (wr_en) begin
            ram_array[w_addr] <= w_data;
        end
    end

    assign r_data = ram_array[r_addr];

endmodule
