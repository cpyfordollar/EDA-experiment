module cnt12(clk, rst, en, a, b, c, d, e, f, g, dp, ds, count, mode, preset);

input clk, rst, en, mode;
input [3:0] preset;

output [7:0] ds;
output a, b, c, d, e, f, g, dp, count;

wire clk_out, cnt;
wire [3:0] cq;

divi u1(.clk(clk), .clk_out(clk_out));

cnt u2(.clk(clk_out), .rst(rst), .en(en), .cq(cq), .count(cnt), .mode(mode), .preset(preset));

seg u3(.clk(clk), .data_in(cq), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .dp(dp), .ds(ds));

assign count = !cnt;

endmodule
