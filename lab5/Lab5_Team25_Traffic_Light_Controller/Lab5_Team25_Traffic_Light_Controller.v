`timescale 1ns/1ps

module Traffic_Light_Controller(clk, rst_n, lr_has_car, hw_light, lr_light);

    input clk, rst_n;
    input lr_has_car;
    output [2:0] hw_light;
    output [2:0] lr_light;

    reg [2:0] state, next_state;
    reg [6:0] hg, hg_next, lg, lg_next;
    reg [4:0] hy, hy_next, ly, ly_next;
    reg [2:0] hw_light, lr_light;

    parameter HGLR = 3'b000;
    parameter HYLR = 3'b001;
    parameter HRLR = 3'b010;
    parameter HRLG = 3'b011;
    parameter HRLY = 3'b100;
    parameter HRLR2 = 3'b101;
    parameter RED = 3'b001;
    parameter YEL = 3'b010;
    parameter GRE = 3'b100;
    
    always @(*) begin
        case (state)
            HGLR : begin
                hw_light = GRE;
                lr_light = RED;
            end
            HYLR : begin
                hw_light = YEL;
                lr_light = RED;
            end
            HRLR : begin
                hw_light = RED;
                lr_light = RED;
            end
            HRLG : begin
                hw_light = RED;
                lr_light = GRE;
            end
            HRLY : begin
                hw_light = RED;
                lr_light = YEL;
            end
            HRLR2 : begin
                hw_light = RED;
                lr_light = RED;
            end
            default : begin
                hw_light = GRE;
                lr_light = RED;
            end
        endcase
    end

    always @(*) begin
        case (state)
            HGLR : begin
                hg_next = (hg + 1 > 70) ? 70 : (hg + 1); 
                lg_next = 0;
                hy_next = 0; ly_next = 0;
            end
            HYLR : begin
                hy_next = hy + 1; ly_next = 0;
                hg_next = 0; lg_next = 0;
            end
            HRLG : begin
                lg_next = (lg + 1 > 70) ? 70 : (lg + 1); 
                hg_next = 0;
                ly_next = 0; hy_next = 0;
            end
            HRLY : begin
                ly_next = ly + 1; hy_next = 0;
                lg_next = 0; hg_next = 0;
            end
            default : begin
                hg_next = 0; lg_next = 0;
                hy_next = 0; hy_next = 0;
            end
        endcase
    end

    always @(*) begin
        case (state)
            HGLR : begin
                if (lr_has_car && hg >= 69) begin
                    next_state = HYLR;
                end else next_state = HGLR;
            end
            HYLR : begin
                if (hy == 24) begin
                    next_state = HRLR;
                end else next_state = HYLR;
            end
            HRLR : begin
                next_state = HRLG;
            end
            HRLG : begin
                if (lg == 69) begin
                    next_state = HRLY;
                end else next_state = HRLG;
            end
            HRLY : begin
                if (ly == 24) begin
                    next_state = HRLR2;
                end else next_state = HRLY;
            end
            HRLR2 : begin
                next_state = HGLR;
            end
            default : begin
                next_state = state;
            end
        endcase
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= HGLR;
            hy <= 0; hg <= 0;
            ly <= 0; lg <= 0;
            hw_light <= GRE;
            lr_light <= RED;
        end else begin
            state <= next_state;
            hy <= hy_next; hg <= hg_next;
            ly <= ly_next; lg <= lg_next;
        end
    end

endmodule
