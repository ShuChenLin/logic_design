module Top(
    input clk,
    input rst,
    input echo,
    input left_signal,
    input right_signal,
    input mid_signal,
    output trig,
    output stop,
    output left_motor,
    output reg [1:0]left,
    output right_motor,
    output reg [1:0]right,
    output [1:0] car_s,
    output [1:0] testl,
    output [1:0] testr
);

    wire Rst_n, rst_pb;
    wire [1:0] car_state;
    debounce d0(rst_pb, rst, clk);
    onepulse d1(rst_pb, clk, Rst_n);
//    wire [1:0] car_state;

    assign car_s = car_state;
    assign testl = left;
    assign testr = right;

    motor A(
        .clk(clk),
        .rst(Rst_n),
        .mode(car_state),
        .pwm({left_motor, right_motor})
    );

    sonic_top B(
        .clk(clk), 
        .rst(Rst_n), 
        .Echo(echo), 
        .Trig(trig),
        .stop(stop)
    );
    
    tracker_sensor C(
        .clk(clk), 
        .reset(Rst_n), 
        .left_signal(left_signal), 
        .right_signal(right_signal),
        .mid_signal(mid_signal), 
        .state(car_state)
       );

    always @(*) begin
        // [TO-DO] Use left and right to set your pwm
        if(stop) {left, right} = 4'b0000;
        else  begin
            case (car_state)
                2'b11 : {left, right} = 4'b0101;
                2'b10 : {left, right} = 4'b1011;
                2'b01 : {left, right} = 4'b1110;
                2'b00 : {left, right} = 4'b1010;
            endcase
        end
    end

endmodule

module debounce (pb_debounced, pb, clk);
    output pb_debounced; 
    input pb;
    input clk;
    reg [4:0] DFF;
    
    always @(posedge clk) begin
        DFF[4:1] <= DFF[3:0];
        DFF[0] <= pb; 
    end
    assign pb_debounced = (&(DFF)); 
endmodule

module onepulse (PB_debounced, clk, PB_one_pulse);
    input PB_debounced;
    input clk;
    output reg PB_one_pulse;
    reg PB_debounced_delay;

    always @(posedge clk) begin
        PB_one_pulse <= PB_debounced & (!PB_debounced_delay);
        PB_debounced_delay <= PB_debounced;
    end 
endmodule
