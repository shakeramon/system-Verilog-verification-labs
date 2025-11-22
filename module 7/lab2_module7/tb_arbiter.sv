module tb_arbiter;

    logic clk;
    logic reset;
    logic req_0;
    logic req_1;
    logic gnt_0;
    logic gnt_1;

    initial clk = 0;
    always #5 clk = ~clk;

    arbiter dut (
        .clk   (clk),
        .reset (reset),
        .req_0 (req_0),
        .req_1 (req_1),
        .gnt_0 (gnt_0),
        .gnt_1 (gnt_1)
    );

    arbiter_checker chk (
        .clk   (clk),
        .reset (reset),
        .req_0 (req_0),
        .req_1 (req_1),
        .gnt_0 (gnt_0),
        .gnt_1 (gnt_1)
    );

        initial begin
        // Start with reset ON
        reset = 1;
        req_0 = 0;
        req_1 = 0;

        // Wait 2 clock cycles
        repeat (2) @(posedge clk);
        reset = 0;

        // Random stimulus
        repeat (20) begin
            @(posedge clk);
            req_0 = $urandom_range(0,1);
            req_1 = $urandom_range(0,1);
        end

      
    end


endmodule : tb_arbiter
