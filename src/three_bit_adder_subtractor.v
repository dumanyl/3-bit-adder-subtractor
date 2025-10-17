`timescale 1ns / 1ps

module three_bit_adder_subtractor (
    output [7:0] led,  // connect output LEDs 0–7 on FPGA
    input  [7:0] swt   // connect input switches 0–7 on FPGA
);

    wire [2:0] X = swt[2:0];
    wire [2:0] Y = swt[5:3];
    wire [2:0] Y_mod;
    wire [2:0] S;
    wire [3:1] C;
    wire M = swt[6]; // mode: 0 = add, 1 = subtract

    // Invert Y when M is high using XOR gates
    assign Y_mod[0] = Y[0] ^ M;
    assign Y_mod[1] = Y[1] ^ M;
    assign Y_mod[2] = Y[2] ^ M;

    // Half Adder 0
    assign S[0] = X[0] ^ Y_mod[0] ^ M;
    assign C[1] = (X[0] & Y_mod[0]) | (M & X[0]) | (Y_mod[0] & M);

    // Full Adder 1
    assign S[1] = X[1] ^ Y_mod[1] ^ C[1];
    assign C[2] = (X[1] & Y_mod[1]) | (Y_mod[1] & C[1]) | (C[1] & X[1]);

    // Full Adder 2
    assign S[2] = X[2] ^ Y_mod[2] ^ C[2];
    assign C[3] = (X[2] & Y_mod[2]) | (Y_mod[2] & C[2]) | (C[2] & X[2]);

    // Overflow detection
    wire overflow_add = (C[2] != C[3]);
    wire overflow_sub = (X[2] != Y[2]) && (S[2] != X[2]);
    wire overflow = M ? overflow_sub : overflow_add;

    // Output mapping
    assign led[2:0] = S;
    assign led[3]   = C[3];
    assign led[4]   = M;
    assign led[5]   = overflow;
    assign led[6]   = C[2];
    assign led[7]   = C[3];

endmodule
