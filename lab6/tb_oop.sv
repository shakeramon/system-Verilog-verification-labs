`timescale 1ns/1ps
import bus_trans_pkg::*;

module tb_oop;

  bus_trans trans_q[$];

  initial begin
    $display("=== LAB 1 part b ? Constrained Random Test ===");

    repeat (10) begin
      bus_trans   tr;
      write_trans wt;
      read_trans  rt;

      if ($urandom_range(0,1) == 0) begin
        wt = new();
        assert(wt.randomize());
        tr = wt;
      end
      else begin
        rt = new();
        assert(rt.randomize());
        tr = rt;
      end

      trans_q.push_back(tr);
    end

    $display("\n=== Display All Constrained Transactions ===");
    foreach (trans_q[i])
      trans_q[i].display();

    $display("\n=== DONE LAB 1 part B ===");
    
  end

endmodule

