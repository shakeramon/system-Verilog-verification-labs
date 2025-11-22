class ip_packet;

  // ---- random header fields ----
  rand bit [31:0] m_src_addr;
  rand bit [31:0] m_dst_addr;
  rand bit [7:0]  m_protocol;

  // ---- NOT random: calculated after randomize ----
  bit [15:0] m_header_checksum;

  // ---- post_randomize: compute checksum after all rand fields set ----
  function void post_randomize();
    bit [31:0] sum;
    sum = m_src_addr + m_dst_addr + m_protocol;
    m_header_checksum = sum[15:0]; // simple checksum: low 16 bits
  endfunction

  // ---- self-checking function ----
  function bit verify_checksum();
    bit [31:0] sum;
    bit [15:0] expected;
    sum = m_src_addr + m_dst_addr + m_protocol;
    expected = sum[15:0];

    if (expected == m_header_checksum) begin
      return 1;
    end
    else begin
      $error("Checksum mismatch! expected=0x%0h got=0x%0h",
             expected, m_header_checksum);
      return 0;
    end
  endfunction

  // ---- display method ----
  function void display();
    $display("------ IP PACKET ------");
    $display(" src_addr = 0x%08h", m_src_addr);
    $display(" dst_addr = 0x%08h", m_dst_addr);
    $display(" protocol = 0x%02h", m_protocol);
    $display(" checksum = 0x%04h", m_header_checksum);
    $display("-----------------------");
  endfunction

endclass : ip_packet
