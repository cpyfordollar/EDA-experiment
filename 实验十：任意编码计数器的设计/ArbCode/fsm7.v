module fsm7(clk,rst,cq);
input clk,rst;
output reg[3:0]cq;

parameter s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7;
reg [3:0] c_st,next_state;

always @(posedge clk) begin
	if(rst==0) c_st<=s1;
	else c_st<=next_state;
end

always @(c_st) begin
	case(c_st)
		s1:begin 
			cq<=0;
			next_state<=s2;
			end
		s2:begin 
			cq<=4'd2;
			next_state<=s3;
			end
		s3:begin 
			cq<=4'd5;
			next_state<=s4;
			end
		s4:begin 
			cq<=4'd3;
			next_state<=s5;
			end
		s5:begin 
			cq<=4'd4;
			next_state<=s6;
			end
		s6:begin 
			cq<=4'd6;
			next_state<=s7;
			end
		s7:begin 
			cq<=4'd1;
			next_state<=s2;
			end
		default: next_state<=s1;
		endcase
		end
endmodule
