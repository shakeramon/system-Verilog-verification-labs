module tb_ordering;

    `include "ordered_trans.sv"

    initial begin
        ordered_trans txn;

        repeat (5) begin
            txn = new();
            assert(txn.randomize()) 
            	else $fatal("randomize failed");
            txn.display();
        end
    end

endmodule : tb_ordering
