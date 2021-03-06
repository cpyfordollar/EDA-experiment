module dot_matrix1(clk,reset,row,col);
input clk,reset;
output reg [15:0]row;      //行 
output reg [3:0]col;       //列
reg [15:0] count1;
reg [31:0] count2;
reg clk_500,divi_1hz;
reg [1:0]cnt4;

always @(posedge clk)
	if(count1==50000000/(5000*2)-1)
		begin
			clk_500 <= ~clk_500;
			count1 <= 16'd0;
		end
	else
		begin
			count1 <= count1 + 16'd1;
		end

always @(posedge clk) begin
	if (count2 == 24999999) begin 
		divi_1hz <= !divi_1hz;
		count2 <= 0;
	end
	else begin
		count2 = count2 + 1;
	end
end

always @(posedge divi_1hz)
	cnt4=cnt4+1;

/***************字符显示*******************/ 
initial col=4'b0;
always @(posedge clk_500) begin
	if (!reset)    col<=4'b0;
	else 
	begin      //利用计数器产生列的  16 种编码：0000-1111
		if(col==4'b1111) col<=4'b0;
		else col<=col+1;
	end
end

always @(reset or col)begin
	if (!reset)  row<=16'b0; 
	else
	begin 
		if(cnt4 == 2'b00) // xue
		begin
			case (col)
			4'b0000: row <= 16'h7FFF; //第 1 列
			4'b0001: row <= 16'h4008; //第 2 列
			4'b0010: row <= 16'h4208; //第 3 列
			4'b0011: row <= 16'h5D8C; //第 4 列
			4'b0100: row <= 16'h6079; //第 5 列
			4'b0101: row <= 16'h0082; //第 6 列
			4'b0110: row <= 16'h10C4; //第 7 列
			4'b0111: row <= 16'h1398; //第 8 列
			4'b1000: row <= 16'h0C90; //第 9 列
			4'b1001: row <= 16'hF080; //第 10 列
			4'b1010: row <= 16'h5080; //第 11 列
			4'b1011: row <= 16'h17FF; //第 12 列
			4'b1100: row <= 16'h1080; //第 13 列
			4'b1101: row <= 16'h1090; //第 14 列
			4'b1110: row <= 16'h1088; //第 15 列
			4'b1111: row <= 16'h1086; //第 16 列
			endcase
		end
		else if(cnt4 == 2'b01) // jie
		begin
			case (col)
			4'b0000: row <= 16'h0010; //第 1 列
			4'b0001: row <= 16'h0062; //第 2 列
			4'b0010: row <= 16'h47a2; //第 3 列
			4'b0011: row <= 16'h5524; //第 4 列
			4'b0100: row <= 16'h5564; //第 5 列
			4'b0101: row <= 16'hf36f; //第 6 列
			4'b0110: row <= 16'h5555; //第 7 列
			4'b0111: row <= 16'h5555; //第 8 列
			4'b1000: row <= 16'h57fd; //第 9 列
			4'b1001: row <= 16'h04e5; //第 10 列
			4'b1010: row <= 16'h0d55; //第 11 列
			4'b1011: row <= 16'hfb6d; //第 12 列
			4'b1100: row <= 16'h8a6f; //第 13 列
			4'b1101: row <= 16'h8a64; //第 14 列
			4'b1110: row <= 16'hf524; //第 15 列
			4'b1111: row <= 16'h1926; //第 16 列
			endcase
		end
		else if(cnt4 == 2'b10) // piao
		begin
			case (col)
			4'b0000: row <= 16'h7ff8; //第 1 列
			4'b0001: row <= 16'h4020; //第 2 列
			4'b0010: row <= 16'h4020; //第 3 列
			4'b0011: row <= 16'h7ff0; //第 4 列
			4'b0100: row <= 16'h0000; //第 5 列
			4'b0101: row <= 16'h8000; //第 6 列
			4'b0110: row <= 16'hffff; //第 7 列
			4'b0111: row <= 16'h8e18; //第 8 列
			4'b1000: row <= 16'hf198; //第 9 列
			4'b1001: row <= 16'h4070; //第 10 列
			4'b1010: row <= 16'h8ff0; //第 11 列
			4'b1011: row <= 16'h8820; //第 12 列
			4'b1100: row <= 16'h8820; //第 13 列
			4'b1101: row <= 16'h8ff0; //第 14 列
			4'b1110: row <= 16'h8000; //第 15 列
			4'b1111: row <= 16'h7fff; //第 16 列
			endcase
		end
		else if(cnt4 == 2'b11) // liang
		begin
			case (col)
			4'b0000: row <= 16'h0001; //第 1 列
			4'b0001: row <= 16'h0202; //第 2 列
			4'b0010: row <= 16'hc204; //第 3 列
			4'b0011: row <= 16'h63fc; //第 4 列
			4'b0100: row <= 16'h0202; //第 5 列
			4'b0101: row <= 16'h0002; //第 6 列
			4'b0110: row <= 16'h0005; //第 7 列
			4'b0111: row <= 16'h1009; //第 8 列
			4'b1000: row <= 16'h1209; //第 9 列
			4'b1001: row <= 16'h1110; //第 10 列
			4'b1010: row <= 16'hd0a0; //第 11 列
			4'b1011: row <= 16'h70c0; //第 12 列
			4'b1100: row <= 16'h13e0; //第 13 列
			4'b1101: row <= 16'h0e30; //第 14 列
			4'b1110: row <= 16'h1018; //第 15 列
			4'b1111: row <= 16'h100c; //第 16 列
			endcase
		end
	end
end
endmodule
 