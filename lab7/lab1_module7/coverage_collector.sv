class coverage_collector;

  // handle to the transaction being sampled
  mem_trans tr_h;

  // ---- covergroup: NO arguments ----
  covergroup mem_trans_cg;

    // Address coverpoint (low / mid / high)
    addr_cp : coverpoint tr_h.m_addr {
      bins low  = { [8'h00 : 8'h3F] };
      bins mid  = { [8'h40 : 8'hBF] };
      bins high = { [8'hC0 : 8'hFF] };
    }

    // Read / Write
    is_write_cp : coverpoint tr_h.m_is_write;

    // Burst length bins
    burst_len_cp : coverpoint tr_h.m_burst_len {
      bins single = {1};
      bins burst  = { [2:8] };
    }

    // Cross coverage
    is_write_x_burst : cross is_write_cp, burst_len_cp;

  endgroup : mem_trans_cg

  // ---- constructor ----
  function new();
    mem_trans_cg = new();
  endfunction

  // ---- sampling method ----
  function void sample(mem_trans t);
    tr_h = t;           // point to the current transaction
    mem_trans_cg.sample();
  endfunction

endclass : coverage_collector
