module divi_1hz(clk,divi_1hz);
input clk;
output reg divi_1hz;
reg [31:0] count_reg1;
always@(posedge clk)
begin
if(count_reg1==32'd12499999)
begin
divi_1hz<=~divi_1hz;
count_reg1<=32'd0;
end
else
begin
count_reg1<=count_reg1+32'd1;
end
end
endmodule