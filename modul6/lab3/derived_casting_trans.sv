class write_trans extends casting_trans;

  function new();
    super.new();
  endfunction
  
  virtual function void display();
    $display("write trans with id = %0d", id);
  endfunction

endclass : write_trans



class error_trans extends casting_trans;

  logic [7:0] error_code;

  function new();
    super.new();
  endfunction
  
  virtual function void display();
    $display("error trans with id = %0d, error_code = 0x%0h",
             id, error_code);
  endfunction

endclass : error_trans
