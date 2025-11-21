// bus_trans_v2.sv
class bus_trans_v2;
  static int global_id = 0;
  int id;
  rand bit [7:0] addr, data;
  rand kind_e kind;

  function new();
    id = global_id++;
  endfunction : new

  // addr between 0x10 and 0xF0
  constraint addr_c {
    addr inside {[8'h10:8'hF0]};
  }

  // if kind is READ, addr must be even
  constraint kind_c {
    
    (kind == READ) -> (addr[0] == 1'b0);
    
  }

endclass : bus_trans_v2
