class scenario_trans;

	rand logic [7:0]  m_addr;
	rand logic [31:0] m_data;
	rand int          m_burst_len;

	constraint burst_C { m_burst_len inside {[1:8]}; }


    typedef enum logic [1:0] {
        IDLE  = 2'b00,
        READ  = 2'b01,
        WRITE = 2'b10
    } opcode_e;

    rand opcode_e op;

    constraint op_dist {
        op dist {
            IDLE  := 20,
            READ  := 40,
            WRITE := 40
        };
    }

      // ---- display method ----
  function void display();
    $display("------ scenario_trans TRANS ------");
    $display("opcode = %s", op.name());
    $display(" addr      = 0x%0h", m_addr);
    $display(" data      = 0x%0h", m_data);
    $display(" burst_len = %0d",   m_burst_len);

    $display("------------------------");
  endfunction


endclass : scenario_trans
