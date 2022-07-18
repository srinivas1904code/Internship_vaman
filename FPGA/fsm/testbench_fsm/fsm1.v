`timescale 10ns/10ps
module finitesm(input x,mclk, output reg y,d1,d2);
reg q1,q2;
reg [10:0] delay;

always @(negedge mclk) begin
	d1<= (!q1 && x)||(q2 && x);
	d2<=(q1 && x) ||(q2 && x);
	y<= q2 && x;
end
always @(posedge mclk) begin
	q1 <= d1;
	q2 <= d2;
end
endmodule
