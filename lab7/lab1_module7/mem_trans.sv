class mem_trans;

  // ---- rand transaction properties ----
  rand logic [7:0]  m_addr;
  rand logic [31:0] m_data;
  rand bit          m_is_write;
  rand int          m_burst_len;

  // ---- constraint: burst length between 1 and 8 ----
  constraint burst_C {
    m_burst_len inside {[1:8]};   // SLIDE SAYS: 1 to 8 (inclusive)
  }

  // ---- display method ----
  function void display();
    $display("------ MEM TRANS ------");
    $display(" addr      = 0x%0h", m_addr);
    $display(" data      = 0x%0h", m_data);
    $display(" is_write  = %0b",   m_is_write);
    $display(" burst_len = %0d",   m_burst_len);
    $display("------------------------");
  endfunction

endclass : mem_trans
