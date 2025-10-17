`timescale 1ns / 1ps

module testbench_three_bit_adder_subtractor;

    wire [7:0] led;
    reg  [7:0] swt;

    // Instantiate the 3-bit adder/subtractor
    three_bit_adder_subtractor UUT (
        .led(led),
        .swt(swt)
    );

    // Stimulus generation
    initial begin
        swt = 8'b00000000; // initialize

        // Test 1: Addition (3 + 2)
        swt[2:0] = 3'b011; // X = 3
        swt[5:3] = 3'b010; // Y = 2
        swt[6] = 1'b0;     // M = 0 (add)
        #10;

        // Test 2: Subtraction (3 - 2)
        swt[6] = 1'b1;     // M = 1 (subtract)
        #10;

        // Test 3: Addition (1 + 3)
        swt[2:0] = 3'b001;
        swt[5:3] = 3'b011;
        swt[6] = 1'b0;
        #10;

        // Test 4: Subtraction (1 - 3)
        swt[6] = 1'b1;
        #10;

        $finish;
    end

endmodule
