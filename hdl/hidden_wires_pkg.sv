
package hidden_wires_pkg;

typedef struct packed {
    logic               startofpacket;
    logic               endofpacket;
    logic [31:0]        data;
} hidden_wires_t;


// Take advantage of the fact that local variables in functions are
// static by default to perform inter-module communication
function void connect(inout hidden_wires_t wires, input logic set);

    hidden_wires_t global_wires;

    if (set)
        global_wires = wires;

    wires = global_wires;
endfunction

endpackage
