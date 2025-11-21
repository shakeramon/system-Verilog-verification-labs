
// bus_trans.sv

class bus_trans;

  static int global_id = 0;
  int id;

  rand logic [3:0] addr;
  rand logic [3:0] data;

  function new();
    id = global_id++;
  endfunction

  virtual function void display();
    $display("[%0t] BUS_TRANS id=%0d addr=0x%0h data=0x%0h",
             $time, id, addr, data);
  endfunction

endclass : bus_trans
