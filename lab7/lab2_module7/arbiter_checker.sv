module arbiter_checker (
    input  logic clk,
    input  logic reset,
    input  logic req_0,
    input  logic req_1,
    input  logic gnt_0,
    input  logic gnt_1
);

    // 1) Illegal state: both grants cannot be 1
    assert property (@(posedge clk)
        !(gnt_0 && gnt_1)
    ) else $error("ERROR: Both grants high!");

    // 2) Reset rule: when reset is high, grants must be 0
    assert property (@(posedge clk)
        reset |-> (!gnt_0 && !gnt_1)
    ) else $error("ERROR: Grants not zero during reset!");

    // 3) Priority rule: if both request, gnt_0 must win
    assert property (@(posedge clk)
        (req_0 && req_1 && !reset) |-> gnt_0
    ) else $error("ERROR: Priority broken! gnt_0 should win.");

endmodule : arbiter_checker
