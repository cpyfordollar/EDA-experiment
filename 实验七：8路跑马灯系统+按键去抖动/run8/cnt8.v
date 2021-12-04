module cnt8(div_clk,q);
input div_clk;
output [2:0] q;
reg [2:0]q;   
parameter num=7;

always @(posedge div_clk)
begin
if(q<num)
begin
q<=q+1'b1;
end
else begin q<=0;
end
end
endmodule
