// derived_trans.sv

// WRITE transaction
class write_trans extends bus_trans;

  function new();
    super.new();
  endfunction

  function void display();
    $display("[%0t] WRITE_TRANS id=%0d addr=0x%0h data=0x%0h",
             $time, id, addr, data);
  endfunction

endclass : write_trans


// READ transaction
class read_trans extends bus_trans;

  function new();
    super.new();
    data.rand_mode(0); // block data randomization
  endfunction

  function void display();
    $display("[%0t] READ_TRANS  id=%0d addr=0x%0h data=0x%0h",
             $time, id, addr, data);
  endfunction

endclass : read_trans
