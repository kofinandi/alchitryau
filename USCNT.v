`timescale 1ns / 1ps

module USCNT(
    input clk,
    output [7:0] cnt_val,
    input rst
    );

reg [6:0] us;
reg [7:0] cnt;

always @(posedge clk)
begin
    if (rst)
    begin
        us <= 7'b0;
        cnt <= 8'b0;
    end
    else
    begin
        if (us == 7'd100)
        begin
            us <= 7'b0;
            cnt <= cnt + 7'b1;
        end
        else us <= us + 1'b1;
    end
end

assign cnt_val = cnt;

endmodule
