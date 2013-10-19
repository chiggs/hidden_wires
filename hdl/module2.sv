module module2 (
    input logic                 clk,
    output logic [31:0]         data,
    output logic                startofpacket,
    output logic                endofpacket
);

hidden_wires_pkg::hidden_wires_t        wires;

always_ff @(posedge clk) begin
    startofpacket <= wires.startofpacket;
    data          <= wires.data;
    endofpacket   <= wires.endofpacket;

    hidden_wires_pkg::connect(wires, 1'b0);
end


endmodule
