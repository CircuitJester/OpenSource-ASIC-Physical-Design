`timescale 1ns/1ps

module tb_id_ex_pipeline_register;

    reg clk, rst, stall, flush;

    reg [31:0] pc_in, rs1_value_in, rs2_value_in, immediate_in;
    reg [4:0] rs1_in, rs2_in, rd_in;
    reg [3:0] alu_control_in;
    reg reg_write_in, mem_read_in, mem_write_in;
    reg mem_to_reg_in, alu_src_in;

    wire [31:0] pc_out, rs1_value_out, rs2_value_out, immediate_out;
    wire [4:0] rs1_out, rs2_out, rd_out;
    wire [3:0] alu_control_out;
    wire reg_write_out, mem_read_out, mem_write_out;
    wire mem_to_reg_out, alu_src_out;

    integer tests_passed;

    id_ex_pipeline_register dut (
        .clk(clk), .rst(rst), .stall(stall), .flush(flush),
        .pc_in(pc_in),
        .rs1_value_in(rs1_value_in),
        .rs2_value_in(rs2_value_in),
        .immediate_in(immediate_in),
        .rs1_in(rs1_in), .rs2_in(rs2_in), .rd_in(rd_in),
        .alu_control_in(alu_control_in),
        .reg_write_in(reg_write_in),
        .mem_read_in(mem_read_in),
        .mem_write_in(mem_write_in),
        .mem_to_reg_in(mem_to_reg_in),
        .alu_src_in(alu_src_in),
        .pc_out(pc_out),
        .rs1_value_out(rs1_value_out),
        .rs2_value_out(rs2_value_out),
        .immediate_out(immediate_out),
        .rs1_out(rs1_out), .rs2_out(rs2_out), .rd_out(rd_out),
        .alu_control_out(alu_control_out),
        .reg_write_out(reg_write_out),
        .mem_read_out(mem_read_out),
        .mem_write_out(mem_write_out),
        .mem_to_reg_out(mem_to_reg_out),
        .alu_src_out(alu_src_out)
    );

    always #5 clk = ~clk;

    task check_outputs;
        input [31:0] exp_pc, exp_rs1_value, exp_rs2_value, exp_immediate;
        input [4:0] exp_rs1, exp_rs2, exp_rd;
        input [3:0] exp_alu_control;
        input exp_reg_write, exp_mem_read, exp_mem_write;
        input exp_mem_to_reg, exp_alu_src;
        input [8*40-1:0] test_name;
        begin
            #1;
            if ({
                pc_out, rs1_value_out, rs2_value_out, immediate_out,
                rs1_out, rs2_out, rd_out, alu_control_out,
                reg_write_out, mem_read_out, mem_write_out,
                mem_to_reg_out, alu_src_out
            } !== {
                exp_pc, exp_rs1_value, exp_rs2_value, exp_immediate,
                exp_rs1, exp_rs2, exp_rd, exp_alu_control,
                exp_reg_write, exp_mem_read, exp_mem_write,
                exp_mem_to_reg, exp_alu_src
            }) begin
                $display("FAIL: %0s", test_name);
                $fatal(1, "ID/EX output mismatch");
            end

            tests_passed = tests_passed + 1;
            $display("PASS: %0s", test_name);
        end
    endtask

    task clock_and_check;
        input [31:0] exp_pc, exp_rs1_value, exp_rs2_value, exp_immediate;
        input [4:0] exp_rs1, exp_rs2, exp_rd;
        input [3:0] exp_alu_control;
        input exp_reg_write, exp_mem_read, exp_mem_write;
        input exp_mem_to_reg, exp_alu_src;
        input [8*40-1:0] test_name;
        begin
            @(posedge clk);
            check_outputs(
                exp_pc, exp_rs1_value, exp_rs2_value, exp_immediate,
                exp_rs1, exp_rs2, exp_rd, exp_alu_control,
                exp_reg_write, exp_mem_read, exp_mem_write,
                exp_mem_to_reg, exp_alu_src, test_name
            );
        end
    endtask

    initial begin
        clk = 0;
        rst = 0;
        stall = 0;
        flush = 0;
        pc_in = 0;
        rs1_value_in = 0;
        rs2_value_in = 0;
        immediate_in = 0;
        rs1_in = 0;
        rs2_in = 0;
        rd_in = 0;
        alu_control_in = 0;
        reg_write_in = 0;
        mem_read_in = 0;
        mem_write_in = 0;
        mem_to_reg_in = 0;
        alu_src_in = 0;
        tests_passed = 0;

        rst = 1;
        clock_and_check(
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            "Synchronous reset"
        );

        rst = 0;
        pc_in = 32'h1000_0040;
        rs1_value_in = 32'h1111_2222;
        rs2_value_in = 32'h3333_4444;
        immediate_in = 32'hFFFF_FF10;
        rs1_in = 5'd3;
        rs2_in = 5'd7;
        rd_in = 5'd12;
        alu_control_in = 4'hA;
        reg_write_in = 1;
        mem_read_in = 1;
        mem_write_in = 0;
        mem_to_reg_in = 1;
        alu_src_in = 1;

        clock_and_check(
            32'h1000_0040, 32'h1111_2222, 32'h3333_4444,
            32'hFFFF_FF10, 5'd3, 5'd7, 5'd12, 4'hA,
            1, 1, 0, 1, 1, "Capture data and control fields"
        );

        stall = 1;
        pc_in = 32'h2000_0080;
        rs1_value_in = 32'hAAAA_AAAA;
        rs2_value_in = 32'hBBBB_BBBB;
        immediate_in = 32'h1234_5678;
        rs1_in = 5'd1;
        rs2_in = 5'd2;
        rd_in = 5'd4;
        alu_control_in = 4'h5;
        reg_write_in = 0;
        mem_read_in = 0;
        mem_write_in = 1;
        mem_to_reg_in = 0;
        alu_src_in = 0;

        clock_and_check(
            32'h1000_0040, 32'h1111_2222, 32'h3333_4444,
            32'hFFFF_FF10, 5'd3, 5'd7, 5'd12, 4'hA,
            1, 1, 0, 1, 1, "Stall holds every output"
        );

        flush = 1;
        clock_and_check(
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            "Flush clears outputs during stall"
        );

        stall = 0;
        flush = 0;
        clock_and_check(
            32'h2000_0080, 32'hAAAA_AAAA, 32'hBBBB_BBBB,
            32'h1234_5678, 5'd1, 5'd2, 5'd4, 4'h5,
            0, 0, 1, 0, 0, "Capture after flush"
        );

        $display("All %0d ID/EX tests passed.", tests_passed);
        $finish;
    end

endmodule
