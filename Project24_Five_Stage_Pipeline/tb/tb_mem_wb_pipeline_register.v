`timescale 1ns/1ps

module tb_mem_wb_pipeline_register;

    reg clk, rst, stall, flush;

    reg [31:0] mem_data_in, alu_result_in;
    reg [4:0] rd_in;
    reg reg_write_in, mem_to_reg_in;

    wire [31:0] mem_data_out, alu_result_out;
    wire [4:0] rd_out;
    wire reg_write_out, mem_to_reg_out;

    integer tests_passed;

    mem_wb_pipeline_register dut (
        .clk(clk), .rst(rst), .stall(stall), .flush(flush),
        .mem_data_in(mem_data_in),
        .alu_result_in(alu_result_in),
        .rd_in(rd_in),
        .reg_write_in(reg_write_in),
        .mem_to_reg_in(mem_to_reg_in),
        .mem_data_out(mem_data_out),
        .alu_result_out(alu_result_out),
        .rd_out(rd_out),
        .reg_write_out(reg_write_out),
        .mem_to_reg_out(mem_to_reg_out)
    );

    always #5 clk = ~clk;

    task check_outputs;
        input [31:0] exp_mem_data, exp_alu_result;
        input [4:0] exp_rd;
        input exp_reg_write, exp_mem_to_reg;
        input [8*40-1:0] test_name;
        begin
            #1;
            if ({
                mem_data_out, alu_result_out, rd_out,
                reg_write_out, mem_to_reg_out
            } !== {
                exp_mem_data, exp_alu_result, exp_rd,
                exp_reg_write, exp_mem_to_reg
            }) begin
                $display("FAIL: %0s", test_name);
                $display("  Memory data: got %h expected %h",
                         mem_data_out, exp_mem_data);
                $display("  ALU result:  got %h expected %h",
                         alu_result_out, exp_alu_result);
                $display("  rd: got %0d expected %0d", rd_out, exp_rd);
                $display("  Controls: got %b%b expected %b%b",
                         reg_write_out, mem_to_reg_out,
                         exp_reg_write, exp_mem_to_reg);
                $fatal(1, "MEM/WB output mismatch");
            end

            tests_passed = tests_passed + 1;
            $display("PASS: %0s", test_name);
        end
    endtask

    task clock_and_check;
        input [31:0] exp_mem_data, exp_alu_result;
        input [4:0] exp_rd;
        input exp_reg_write, exp_mem_to_reg;
        input [8*40-1:0] test_name;
        begin
            @(posedge clk);
            check_outputs(
                exp_mem_data, exp_alu_result, exp_rd,
                exp_reg_write, exp_mem_to_reg, test_name
            );
        end
    endtask

    initial begin
        clk = 0;
        rst = 0;
        stall = 0;
        flush = 0;
        mem_data_in = 0;
        alu_result_in = 0;
        rd_in = 0;
        reg_write_in = 0;
        mem_to_reg_in = 0;
        tests_passed = 0;

        rst = 1;
        clock_and_check(0, 0, 0, 0, 0, "Synchronous reset");

        rst = 0;
        mem_data_in = 32'hFACE_1234;
        alu_result_in = 32'hABCD_5678;
        rd_in = 5'd21;
        reg_write_in = 1;
        mem_to_reg_in = 1;
        clock_and_check(
            32'hFACE_1234, 32'hABCD_5678, 5'd21,
            1, 1, "Capture memory and ALU data"
        );

        stall = 1;
        mem_data_in = 32'h1111_1111;
        alu_result_in = 32'h2222_2222;
        rd_in = 5'd3;
        reg_write_in = 0;
        mem_to_reg_in = 0;
        clock_and_check(
            32'hFACE_1234, 32'hABCD_5678, 5'd21,
            1, 1, "Stall holds every output"
        );

        flush = 1;
        clock_and_check(0, 0, 0, 0, 0,
                        "Flush clears outputs during stall");

        stall = 0;
        flush = 0;
        clock_and_check(
            32'h1111_1111, 32'h2222_2222, 5'd3,
            0, 0, "Capture after flush"
        );

        $display("All %0d MEM/WB tests passed.", tests_passed);
        $finish;
    end

endmodule
