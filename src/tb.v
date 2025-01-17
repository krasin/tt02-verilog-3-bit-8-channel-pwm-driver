`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
    input 	 clk,
    input 	 pset,
    input [2:0]  addr,
    input [2:0]  level,
    output [7:0] pwm_out
   );

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    wire [7:0] inputs = {level, addr, pset, clk};
    wire [7:0] outputs;
    assign pwm_out = outputs[7:0];

    // instantiate the DUT
    krasin_3_bit_8_channel_pwm_driver krasin_3_bit_8_channel_pwm_driver(
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule
