`timescale 1ns/1ps

module tb_if_id_pipeline_register;

    reg clk;
    reg rst;
    reg stall;
    reg flush;

    reg [31:0] pc_in;
    reg [31:0] instruction_in;

    wire [31:0] pc_out;
    wire [31:0] instruction_out;

    integer tests_passed;

    if_id_pipeline_register dut (
        .clk(clk),
        .rst(rst),
        .stall(stall),
        .flush(flush),
        .pc_in(pc_in),
        .instruction_in(instruction_in),
        .pc_out(pc_out),
        .instruction_out(instruction_out)
    );

    always #5 clk = ~clk;

    task check_outputs;
        input [31:0] expected_pc;
        input [31:0] expected_instruction;
        input [8*40-1:0] test_name;
        begin
            #1;

            if ((pc_out !== expected_pc) ||
                (instruction_out !== expected_instruction)) begin
                $display("FAIL: %0s", test_name);
                $display("  PC:          got %h, expected %h",
                         pc_out, expected_pc);
                $display("  Instruction: got %h, expected %h",
                         instruction_out, expected_instruction);
                $fatal(1, "IF/ID pipeline-register test failed");
            end

            tests_passed = tests_passed + 1;
            $display("PASS: %0s", test_name);
        end
    endtask

    task clock_and_check;
        input [31:0] expected_pc;
        input [31:0] expected_instruction;
        input [8*40-1:0] test_name;
        begin
            @(posedge clk);
            check_outputs(expected_pc, expected_instruction, test_name);
        end
    endtask

    initial begin
        clk = 1'b0;
        rst = 1'b0;
        stall = 1'b0;
        flush = 1'b0;
        pc_in = 32'b0;
        instruction_in = 32'b0;
        tests_passed = 0;

        // Reset clears both registered outputs.
        rst = 1'b1;
        clock_and_check(32'b0, 32'b0, "Synchronous reset");

        // Normal operation captures the inputs.
        rst = 1'b0;
        pc_in = 32'h0000_1000;
        instruction_in = 32'h1234_ABCD;
        clock_and_check(32'h0000_1000, 32'h1234_ABCD,
                        "Normal input capture");

        // Stall must hold the previously captured values.
        stall = 1'b1;
        pc_in = 32'h0000_2000;
        instruction_in = 32'hDEAD_BEEF;
        clock_and_check(32'h0000_1000, 32'h1234_ABCD,
                        "Stall holds previous values");

        // Flush clears the outputs, even while stall is asserted.
        flush = 1'b1;
        clock_and_check(32'b0, 32'b0, "Flush clears outputs during stall");

        // Release stall and flush; new inputs should be captured.
        stall = 1'b0;
        flush = 1'b0;
        pc_in = 32'h0000_3000;
        instruction_in = 32'hCAFE_0123;
        clock_and_check(32'h0000_3000, 32'hCAFE_0123,
                        "Capture after flush");

        $display("All %0d IF/ID tests passed.", tests_passed);
        $finish;
    end

endmodule
