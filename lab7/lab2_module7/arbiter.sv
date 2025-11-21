module arbiter (
    input  logic clk,
    input  logic reset,
    input  logic req_0,
    input  logic req_1,
    output logic gnt_0,
    output logic gnt_1
);


	always_ff @(posedge clk) begin : proc_
    if (reset) begin
        // reset active: no one gets grant
        gnt_0 <= 1'b0;
        gnt_1 <= 1'b0;
    end
    else if (req_0) begin
        // req_0 has priority
        gnt_0 <= 1'b1;
        gnt_1 <= 1'b0;
    end
    else if (req_1) begin
        gnt_0 <= 1'b0;
        gnt_1 <= 1'b1;
    end
    else begin
        // no requests
        gnt_0 <= 1'b0;
        gnt_1 <= 1'b0;
    end
end


endmodule : arbiter
