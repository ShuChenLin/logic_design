// <Student_ID> <Name>

module exam1_B(clk, rst, result);
    //Your design here

    input clk, rst;
    output reg signed [19:0] result;

    reg [10:0] cnt = 1'b0;
    reg [10:0] next_cnt;
    reg [19:0] ans = 0;
    reg [19:0] next_ans;
    reg dir = 1;
    reg next_dir;
    
    always @(*) begin
        if (dir) begin
            if (result === 20'd183921) begin
                next_dir = 0;
                next_cnt = 10'd2;
                next_ans = result - 1;
                $display("next_dir : %b, next_cnt : %d", next_dir, cnt);
            end else if ((result % 8) === (cnt % 8)) begin
                next_ans = result + (cnt * 3);
                next_dir = dir;
                next_cnt = cnt + 1;
            end else begin
                next_ans = result + cnt;
                next_dir = dir;
                next_cnt = cnt + 1;
            end
        end
        else begin
            if (result === 20'b0) begin
                next_cnt = 2;
                next_dir = 1;
                next_ans = 1;
            end else begin
                next_ans = result - cnt;
                next_dir = dir;
                next_cnt = cnt + 1;
            end
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            result <= 20'b0;
            dir <= 1;
            cnt <= 1;
        end else begin
            result <= next_ans;
            //$display("%b", next_cnt);
            dir <= next_dir;
            cnt <= next_cnt;
        end
    end



endmodule

// You can add any module you need.
// Make sure you include all modules you used in this problem.
