// An example of using the static storage of a function to communicate
// between modules. Compiles correctly in Quartus 13.0
//
// This could be useful for pulling things from various points deep in
// a hierarchy without having to wire signals through each level.
//
// Potential applications -
//      * Debug (JTAG, Logic analyser)
//      * Statistics
//      * Global event logging

module top (
    input logic                 clk,

    input  logic [31:0]         stream_in_data,
    input  logic                stream_in_startofpacket,
    input  logic                stream_in_endofpacket,

    output logic [31:0]         stream_out_data,
    output logic                stream_out_startofpacket,
    output logic                stream_out_endofpacket
);

module1 m1 (
    .clk                (clk),

    // Module one only has inputs
    .startofpacket      (stream_in_startofpacket),
    .endofpacket        (stream_in_endofpacket),
    .data               (stream_in_data)
);

// *************************************************
// No direct connections between these two modules *
// *************************************************

module2 m2 (
    .clk                (clk),

    // Module 2 only has outputs
    .startofpacket      (stream_out_startofpacket),
    .endofpacket        (stream_out_endofpacket),
    .data               (stream_out_data)
);

endmodule
