module tb_scenario;

    `include "scenario_trans.sv"

    initial begin
        scenario_trans txn;

        repeat (50) begin
            txn = new();
            if (!txn.randomize()) begin
                $display("Randomization failed!");
            end
            txn.display();   
        end
    end

endmodule : tb_scenario
