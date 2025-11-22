module arbiter_checker (
    input  logic clk,
    input  logic reset,
    input  logic req_0,
    input  logic req_1,
    input  logic gnt_0,
    input  logic gnt_1
);

    assert property (@(posedge clk) disable iff (reset)
        !(gnt_0 && gnt_1)
    ) else $error("Both grants high!");

    assert property (@(posedge clk) disable iff (reset)
        gnt_0 |-> $past(req_0)
    ) else $error("gnt_0 without req_0 prev cycle");

    assert property (@(posedge clk) disable iff (reset)
        gnt_1 |-> $past(req_1)
    ) else $error("gnt_1 without req_1 prev cycle");

    cover property (@(posedge clk)
        req_0 |-> gnt_0
    );

endmodule
