`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
// A module that creates the dig_n[] and seg_n[] signals from hexadecimal input   //
// digits and dp selectors to drive the 7 segment display using time-multiplexing //
//                                                                                //
//                   created by: Daniel Kiovics, Nandor Kofarago                  //
////////////////////////////////////////////////////////////////////////////////////

module SEG7(
    input [3:0] dig0,
    input [3:0] dig1,
    input [3:0] dig2,
    input [3:0] dig3,
    input [3:0] dp,
    input clk,
    output [7:0] seg_n,
    output [3:0] dig_n
    );
    
    reg [15:0] cnt;
    reg [1:0] dig_mux;
    
    always @(posedge clk)
    begin
        if (cnt==0)
            begin
                dig_mux <= dig_mux + 1;
            end
        cnt <= cnt+1;
    end
    
    reg [3:0] dig_dec;
    reg [3:0] sel_dig;
    
    always @(*)
    begin
        case (dig_mux)
            2'b00 : begin
                        dig_dec <= ~4'b0001;
                        sel_dig <= dig0;
                    end
            2'b01 : begin
                        dig_dec <= ~4'b0010;
                        sel_dig <= dig1;
                    end
            2'b10 : begin
                        dig_dec <= ~4'b0100;
                        sel_dig <= dig2;
                    end
            2'b11 : begin
                        dig_dec <= ~4'b1000;
                        sel_dig <= dig3;
                    end
        endcase
    end
    
    reg [6:0] seg_out;
    
    always @(*)
    begin
        case (sel_dig)
            4'h0 : seg_out <= 7'b1000000;
            4'h1 : seg_out <= 7'b1111001;
            4'h2 : seg_out <= 7'b0100100;
            4'h3 : seg_out <= 7'b0110000;
            4'h4 : seg_out <= 7'b0011001;
            4'h5 : seg_out <= 7'b0010010;
            4'h6 : seg_out <= 7'b0000010;
            4'h7 : seg_out <= 7'b1111000;
            4'h8 : seg_out <= 7'b0000000;
            4'h9 : seg_out <= 7'b0010000;
            4'ha : seg_out <= 7'b0001000;
            4'hb : seg_out <= 7'b0000011;
            4'hc : seg_out <= 7'b1000110;
            4'hd : seg_out <= 7'b0100001;
            4'he : seg_out <= 7'b0000110;
            4'hf : seg_out <= 7'b0001110;
        endcase
    end
    
    assign seg_n[6:0] = seg_out;
    assign seg_n[7] = ~dp[dig_mux];
    assign dig_n = dig_dec;
    
endmodule