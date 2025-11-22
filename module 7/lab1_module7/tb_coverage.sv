// tb_coverage.sv  (Part C – final)

`include "mem_trans.sv"
`include "coverage_collector.sv"

module tb_coverage;

  initial begin
    mem_trans          txn;
    coverage_collector cg;

    cg = new();   // create coverage collector once

    repeat (100) begin
      txn = new();

      if (!txn.randomize())
        $error("Randomization FAILED!");

      txn.display();   // show the transaction
      cg.sample(txn);  // sample coverage
    end

    // print overall coverage
    $display("====================================");
    $display("Final Coverage = %0.2f%%", $get_coverage());
    $display("====================================");

    
  end

endmodule : tb_coverage
