Hidden Wires
============


Description
-----------

SystemVerilog proof-of-concept for using static variables inside functions to
communicate between modules.

This allows connections to be made without having to add wiring through the
hierarchy. Possible applications include pulling signals out to logic
analyser, writing to global resources (event log, statistics, UART etc.)

This project compiles and does the "right thing" but there is an
unintended side-effect - Quartus also creates top-level pins for the static
variables in addition to wiring between the modules.

Diagram
-------

           +-------------------------------------------+
           |  top                                      |
           +-------------------------------------------+
           |                                           |
           |     +---------+           +---------+     |
           |     | module1 |           | module2 |     |
           |     |---------|           |---------|     |
           |     |         |           |         |     |
         +------->         |           |         +------->
         +------->         |           |         +------->
         +------->         |           |         +------->
           |     |         |           |         |     |
           |  +----(set=1) |           | (set=0)----+  |
           |  |  |         |           |         |  |  |
           |  |  +---------+           +---------+  |  |
           |  |                                     |  |
           |  |                                     |  |
           |  |                                     |  |
           |  |    +---------------------------+    |  |
           |  |    | hidden_wires_pkg::connect |    |  |
           |  |    |---------------------------|    |  |
           |  |    | static variable           |    |  |
           |  +--->|                           |<---+  |
           |       |                           |       |
           |       +---------------------------+       |
           |                                           |
           +-------------------------------------------+

