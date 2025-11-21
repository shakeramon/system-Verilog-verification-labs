// tb_constrained.sv

// Import the package so we can use the classes
import bus_trans_v2_pkg::*;

module tb_constrained;

  // Declare the object handles and loop counter at module scope
  write_trans_v2 w;
  read_trans_v2  r;
  int i;

  initial begin

    // ==============================
    // 1) High-data WRITES (data > 200)
    // ==============================

    w = new();   // create the object

    for (i = 0; i < 10; i++) begin

      // randomize with an INLINE constraint
      if (!w.randomize() with { data > 8'd200; }) begin
        $error("Write randomization FAILED");
      end
      else begin
        // print the values
        $display("[WRITE] id=%0d addr=%0h data=%0h kind=%0s",
                 w.id, w.addr, w.data,
                 (w.kind == WRITE) ? "WRITE" : "READ");
      end
    end


    // ==============================
    // 2) Low-address READS (addr < 0x80)
    // ==============================

    r = new();   // create the object

    for (i = 0; i < 10; i++) begin

      // randomize with a different INLINE constraint
      if (!r.randomize() with { addr < 8'h80; }) begin
        $error("Read randomization FAILED");
      end
      else begin
        // print the values
        $display("[READ ] id=%0d addr=%0h data=%0h kind=%0s",
                 r.id, r.addr, r.data,
                 (r.kind == READ) ? "READ" : "WRITE");
      end
    end

    $finish;
  end

endmodule
