`timescale 1ns/1ps

module tb_ex_mem_pipeline_register;

    reg clk, rst, stall, flush;

    reg [31:0] alu_result_in, store_data_in;
    reg [4:0] rd_in;
    reg zero_in;
    reg reg_write_in, mem_read_in, mem_write_in, mem_to_reg_in;

    wire [31:0] alu_result_out, store_data_out;
    wire [4:0] rd_out;
    wire zero_out;
    wire reg_write_out, mem_read_out, mem_write_out, mem_to_reg_out;

    integer tests_passed;

    ex_mem_pipeline_register dut (
        .clk(clk), .rst(rst), .stall(stall), .flush(flush),
        .alu_result_in(alu_result_in),
        .store_data_in(store_data_in),
        .rd_in(rd_in),
        .zero_in(zero_in),
        .reg_write_in(reg_write_in),
        .mem_read_in(mem_read_in),
        .mem_write_in(mem_write_in),
        .mem_to_reg_in(mem_to_reg_in),
        .alu_result_out(alu_result_out),
        .store_data_out(store_data_out),
        .rd_out(rd_out),
        .zero_out(zero_out),
        .reg_write_out(reg_write_out),
        .mem_read_out(mem_read_out),
        .mem_write_out(mem_write_out),
        .mem_to_reg_out(mem_to_reg_out)
    );

    always #5 clk = ~clk;

    task check_outputs;
        input [31:0] exp_alu_result, exp_store_data;
        input [4:0] exp_rd;
        input exp_zero, exp_reg_write, exp_mem_read;
        input exp_mem_write, exp_mem_to_reg;
        input [8*40-1:0] test_name;
        begin
            #1;
            if ({
                alu_result_out, store_data_out, rd_out, zero_out,
                reg_write_out, mem_read_out, mem_write_out, mem_to_reg_out
            } !== {
                exp_alu_result, exp_store_data, exp_rd, exp_zero,
                exp_reg_write, exp_mem_read, exp_mem_write, exp_mem_to_reg
            }) begin
                $display("FAIL: %0s", test_name);
                $display("  ALU result: got %h expected %h",
                         alu_result_out, exp_alu_result);
                $display("  Store data: got %h expected %h",
                         store_data_out, exp_store_data);
                $display("  rd: got %0d expected %0d", rd_out, exp_rd);
                $display("  Control outputs: got %b%b%b%b expected %b%b%b%b",
                         zero_out, reg_write_out, mem_read_out,
                         mem_write_out, mem_to_reg_out,
                         exp_zero, exp_reg_write, exp_mem_read,
                         exp_mem_write, exp_mem_to_reg);
                $fatal(1, "EX/MEM output mismatch");
            end

            tests_passed = tests_passed + 1;
            $display("PASS: %0s", test_name);
        end
    endtask

    task clock_and_check;
        input [31:0] exp_alu_result, exp_store_data;
        input [4:0] exp_rd;
        input exp_zero, exp_reg_write, exp_mem_read;
        input exp_mem_write, exp_mem_to_reg;
        input [8*40-1:0] test_name;
        begin
            @(posedge clk);
            check_outputs(
                exp_alu_result, exp_store_data, exp_rd,
                exp_zero, exp_reg_write, exp_mem_read,
                exp_mem_write, exp_mem_to_reg, test_name
            );
        end
    endtask

    initial begin
        clk = 0;
        rst = 0;
        stall = 0;
        flush = 0;
        alu_result_in = 0;
        store_data_in = 0;
        rd_in = 0;
        zero_in = 0;
        reg_write_in = 0;
        mem_read_in = 0;
        mem_write_in = 0;
        mem_to_reg_in = 0;
        tests_passed = 0;

        rst = 1;
        clock_and_check(0, 0, 0, 0, 0, 0, 0, 0, "Synchronous reset");

        rst = 0;
        alu_result_in = 32'hABCD_1234;
        store_data_in = 32'h5678_9ABC;
        rd_in = 5'd19;
        zero_in = 1;
        reg_write_in = 1;
        mem_read_in = 1;
        mem_write_in = 0;
        mem_to_reg_in = 1;
        clock_and_check(
            32'hABCD_1234, 32'h5678_9ABC, 5'd19,
            1, 1, 1, 0, 1, "Capture data and control fields"
        );

        stall = 1;
        alu_result_in = 32'h1111_1111;
        store_data_in = 32'h2222_2222;
        rd_in = 5'd4;
        zero_in = 0;
        reg_write_in = 0;
        mem_read_in = 0;
        mem_write_in = 1;
        mem_to_reg_in = 0;
        clock_and_check(
            32'hABCD_1234, 32'h5678_9ABC, 5'd19,
            1, 1, 1, 0, 1, "Stall holds every output"
        );

        flush = 1;
        clock_and_check(0, 0, 0, 0, 0, 0, 0, 0,
                        "Flush clears outputs during stall");

        stall = 0;
        flush = 0;
        clock_and_check(
            32'h1111_1111, 32'h2222_2222, 5'd4,
            0, 0, 0, 1, 0, "Capture after flush"
        );

        $display("All %0d EX/MEM tests passed.", tests_passed);
        $finish;
    end

endmodule
