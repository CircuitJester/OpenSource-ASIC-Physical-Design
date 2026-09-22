`timescale 1ns/1ps

module tb_pipeline_control_unit;

    reg stall_request;
    reg flush_request;

    wire pc_write;
    wire if_id_write;
    wire id_ex_flush;

    integer tests_passed;

    pipeline_control_unit dut (
        .stall_request(stall_request),
        .flush_request(flush_request),
        .pc_write(pc_write),
        .if_id_write(if_id_write),
        .id_ex_flush(id_ex_flush)
    );

    task check_outputs;
        input expected_pc_write;
        input expected_if_id_write;
        input expected_id_ex_flush;
        begin
            #1;

            if ({pc_write, if_id_write, id_ex_flush} !==
                {expected_pc_write, expected_if_id_write,
                 expected_id_ex_flush}) begin
                $display("FAIL: stall=%b flush=%b | got %b%b%b, expected %b%b%b",
                         stall_request, flush_request,
                         pc_write, if_id_write, id_ex_flush,
                         expected_pc_write, expected_if_id_write,
                         expected_id_ex_flush);
                $fatal(1, "Control-unit test failed");
            end

            tests_passed = tests_passed + 1;
            $display("PASS: stall=%b flush=%b | outputs=%b%b%b",
                     stall_request, flush_request,
                     pc_write, if_id_write, id_ex_flush);
        end
    endtask

    initial begin
        stall_request = 1'b0;
        flush_request = 1'b0;
        tests_passed = 0;

        check_outputs(1'b1, 1'b1, 1'b0);

        stall_request = 1'b1;
        flush_request = 1'b0;
        check_outputs(1'b0, 1'b0, 1'b1);

        stall_request = 1'b0;
        flush_request = 1'b1;
        check_outputs(1'b1, 1'b1, 1'b1);

        stall_request = 1'b1;
        flush_request = 1'b1;
        check_outputs(1'b1, 1'b1, 1'b1);

        $display("All %0d control-unit tests passed.", tests_passed);
        $finish;
    end

endmodule
