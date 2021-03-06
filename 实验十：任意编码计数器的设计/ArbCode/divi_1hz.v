module divi_1hz(clk,divi_1hz);
input clk;
output reg divi_1hz;
reg [31:0]count;

initial begin
	count = 0;
	divi_1hz = 0;
end

always @(posedge clk) begin
	if (count == 24999999) begin 
		divi_1hz <= !divi_1hz;
		count <= 0;
	end
	else begin
		count = count + 1;
	end
end

endmodule