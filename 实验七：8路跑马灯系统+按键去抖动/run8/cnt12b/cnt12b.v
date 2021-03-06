module cnt12b(clk,rst,en,DS,A,B,C,D,E,F,G,DP,cout,D_in);
input clk,rst,en;
output cout;
output A,B,C,D,E,F,G,DP;
output DS;
output wire [3:0]D_in;
wire cout_temp;
wire divi_1hz;
wire [3:0] d_in;
assign cout = ~cout_temp;
assign D_in = cq;
divi_1hz u1(
.clk(clk),
.divi_1hz(clk1));

cnt12 u2(
.clk1(divi_1hz),
.rst(rst) ,
.en(en) ,
.cq(d_in),
.cout(cout_temp));

seg u3(
.d_in(cq),
.a(A),
.b(B),
.c(C),
.d(D),
.e(E),
.f(F),
.g(G),
.dp(DP),
.ds(DS));

endmodule