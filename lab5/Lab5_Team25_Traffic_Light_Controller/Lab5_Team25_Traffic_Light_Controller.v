`timescale 1ns/1ps

module Traffic_Light_Controller (clk, rst_n, lr_has_car, hw_light, lr_light);

    input clk, rst_n;
    input lr_has_car;
    output [2:0] hw_light;
    output [2:0] lr_light;

    reg [2:0] state, next_state;
    reg [7:0] hg, hg_next, lg, lg_next;
    reg [4:0] hy, hy_next, ly, ly_next;
    reg hr, hr_next, lr, lr_next;

    parameter HGLR = 3'b000;
    parameter HYLR = 3'b001;
    parameter HRLR = 3'b010;
    parameter HRLG = 3'b011;
    parameter HRLY = 3'b100;
    parameter HRLR2 = 3'b101;

    always @(*) begin
        case (state)
            HGLR : begin
                hg_next = hg + 1; lg_next = 0;
                hy_next = 0; ly_next = 0;
                hr_next = 0; lr_next = 0;    
            end
            HYLR : begin
                hy_next = hy + 1; ly_next = 0;
                hg_next = 0; lg_next = 0;
                hr_next = 0; lr_next = 0; 
            end
            HRLR : begin
                hr_next = hr + 1; lr_next = 0;
                hg_next = 0; lg_next = 0;
                hy_next = 0; ly_next = 0;
            end
            HRLG : begin
                lg_next = lg + 1; hg_next = 0;
                ly_next = 0; hy_next = 0;
                lr_next = 0; hr_next = 0;
            end
            HRLY : begin
                ly_next = ly + 1; hy_next = 0;
                lg_next = 0; hg_next = 0;
                lr_next = 0; hr_next = 0;
            end
            HRLR2 : begin
                lr_next = lr + 1; hr_next = 0;
                hg_next = 0; lg_next = 0;
                hr_next = 0; lr_next = 0;
            end
            default : begin
                hg_next = 0; lg_next = 0;
                hr_next = 0; lr_next = 0;        
                hy_next = 0; hr_next = 0;
            end
        endcase
    end

    always @(posedge clk) begin
        case (state)
            HGLR : begin
                if (lr_has_car && hg >= 3) begin
                    next_state = HYLR;
                end else next_state = HGLR;
            end
            HYLR : begin
                if (hy == 2) begin
                    next_state = HRLR;
                end else next_state = HYLR;
            end
            HRLR : begin
                if (hr) begin
                    next_state = HRLR;
                end else next_stae = HRLG;
            end
            HRLG : begin
                if (lg == 3) begin
                    next_state = HRLG;
                end else next_state = HRLY;
            end
            HRLY : begin
                if (ly == 2) begin
                    next_state = HRLR2;
                end else next_state = HRLY;
            end
            HRLR2 : begin
                if (lr) begin
                    next_state = HGLR;
                end else next_state = HRLR2;
            end
            default : begin
                next_state = state;
            end
        endcase
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= HGLR;
        end else begin
            state <= next_state;
        end
    end

endmodule
