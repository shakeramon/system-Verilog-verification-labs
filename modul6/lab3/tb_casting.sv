module tb_casting;

  import casting_trans_pkg::*;   // bring casting_trans, write_trans, error_trans

  // Queue of BASE-class handles
  casting_trans trans_q[$];

  initial begin
    write_trans  w;
    error_trans  e;

    // ---- fill the queue (mix of write_trans & error_trans) ----
    w = new();
    trans_q.push_back(w);

    e = new();
    e.error_code = 8'hAA;
    trans_q.push_back(e);

    e = new();
    e.error_code = 8'h55;
    trans_q.push_back(e);

    w = new();
    trans_q.push_back(w);

    // ---- iterate and try to DOWN-CAST to error_trans ----
    foreach (trans_q[i]) begin
      error_trans err_handle;   // specialized handle

      if ($cast(err_handle, trans_q[i])) begin
        // cast succeeded → this element is error_trans
        $display("OK   i=%0d  error_code = 0x%0h",
                 i, err_handle.error_code);
      end
      else begin
        // cast failed → not an error_trans
        $display("SKIP i=%0d  not an error_trans", i);
      end
    end

    $finish;
  end

endmodule
