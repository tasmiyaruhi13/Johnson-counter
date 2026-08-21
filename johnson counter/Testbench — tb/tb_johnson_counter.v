`timescale 1ns/1ps

module tb_johnson_counter;

    reg        clk;
    reg        reset;
    wire [3:0] q;

    // Instantiate Johnson Counter
    johnson_counter uut (
        .clk   (clk),
        .reset (reset),
        .q     (q)
    );

    // 10 ns clock period
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("johnson_counter.vcd");
        $dumpvars(0, tb_johnson_counter);

        // Initialize
        clk   = 1'b0;
        reset = 1'b1;

        $display("========================================");
        $display("       4-BIT JOHNSON COUNTER TEST");
        $display("========================================");
        $display("Time\tReset\tQ");
        $display("----------------------------------------");

        $monitor("%0t\t%b\t%b", $time, reset, q);

        // Keep reset active
        #12;
        reset = 1'b0;

        // Run for 10 clock cycles
        #100;

        $display("----------------------------------------");
        $display("Simulation completed successfully.");
        $finish;
    end

endmodule