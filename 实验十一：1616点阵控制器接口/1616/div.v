module div(clk,clk_500);
input clk;
output reg clk_500;
reg [15:0] count;

always @(posedge clk)
	if(count ==  50000000/(5000*2)-1)
		begin
			clk_500 <= ~clk_500;
			count <= 16'd0;
		end
	else
		begin
			count <= count + 16'd1;
		end
endmodule 