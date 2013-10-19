module module1 (
    input logic                 clk,
    input logic [31:0]          data,
    input logic                 startofpacket,
    input logic                 endofpacket
);

hidden_wires_pkg::hidden_wires_t        wires;

always_ff @(posedge clk) begin

    hidden_wires_pkg::connect(wires, 1'b1);

    wires.startofpacket <= startofpacket;
    wires.data          <= data;
    wires.endofpacket   <= endofpacket;
end


endmodule
