`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
// A module that turns the binary input into decimal output of 4 (decimal) digits //
//                                                                                //
//                           created by: Nandor Kofarago                          //
////////////////////////////////////////////////////////////////////////////////////

module BTD(
    input clk,
    input wire [13:0] binary_in,
    output reg [3:0] dig0,
    output reg [3:0] dig1,
    output reg [3:0] dig2,
    output reg [3:0] dig3
    );

    parameter INIT = 2'b00;
    parameter A = 2'b01;
    parameter B = 2'b10;
    parameter C = 2'b11;
    
    reg [1:0] state;
    reg [13:0] convert;
    
    reg [3:0] dig1_cnt;
    reg [3:0] dig2_cnt;
    reg [3:0] dig3_cnt;
    
    wire gt_1000 = (convert >= 14'd1000);
    wire gt_100 = (convert >= 14'd100);
    wire gt_10 = (convert >= 14'd10);
    
    always @(posedge clk)
    begin
        case (state)
            INIT : 
                begin
                    convert <= binary_in;
                    dig1_cnt <= 4'b0000;
                    dig2_cnt <= 4'b0000;
                    dig3_cnt <= 4'b0000;
                    state <= A;
                end
            A : 
                begin
                    if (gt_1000)
                        begin
                            convert <= convert - 14'd1000;
                            dig3_cnt <= dig3_cnt + 1;
                            state <= A;
                        end
                    else
                        state <= B;
                end
            B : 
                begin
                    if (gt_100)
                        begin
                            convert <= convert - 14'd100;
                            dig2_cnt <= dig2_cnt + 1;
                            state <= B;
                        end
                    else
                        state <= C;
                end
            C : 
                begin
                    if (gt_10)
                        begin
                            convert <= convert - 14'd10;
                            dig1_cnt <= dig1_cnt + 1;
                            state <= C;
                        end
                    else
                        begin
                            state <= INIT;
                            dig0 <= convert;
                            dig1 <= dig1_cnt;
                            dig2 <= dig2_cnt;
                            dig3 <= dig3_cnt;
                        end
                end
        endcase
    end
    
endmodule
