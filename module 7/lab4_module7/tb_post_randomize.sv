// tb_post_randomize.sv
module tb_post_randomize;

  `include "ip_packet.sv"

  initial begin
    ip_packet pkt;

    repeat (5) begin
      pkt = new();

      // randomize and make sure it succeeded
      assert(pkt.randomize()) else $fatal("Randomize failed");

      // show fields
      pkt.display();

      // self-checking: verify checksum
      assert(pkt.verify_checksum())
        else $fatal("Checksum verification failed");
    end

    
  end

endmodule : tb_post_randomize
