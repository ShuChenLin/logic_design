module tb_Greatest_common_divisor;

reg start;
reg [15:0] a;
reg [15:0] b;
reg clk;
reg rst_n;
wire [15:0] gcd;
wire done;

initial begin
    $from_myhdl(
        start,
        a,
        b,
        clk,
        rst_n
    );
    $to_myhdl(
        gcd,
        done
    );
end

Greatest_common_divisor dut(
    start,
    a,
    b,
    clk,
    rst_n,
    gcd,
    done
);

endmodule
