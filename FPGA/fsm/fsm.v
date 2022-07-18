// verilog code to implement finate state machine using fpga
module finitesm(input x,output y,cl);
reg q1,q2;
reg d1,d2;
initial begin
q1 = 0;
q2 = 0;
end
reg [28:0] delay;
wire clk;
reg mclk;
qlal4s3b_cell_macro u_qlal4s3b_cell_macro (.Sys_Clk0 (clk),);
always @(posedge clk) begin
	delay = delay+1;
	if(delay>40000000) begin
	mclk = !mclk;
	delay = 0;
	end
end
always @(negedge mclk) begin
	d1= (!q1 && x)||(q2 && x);
	d2=(q1 && x) ||(q2 && x);
	y= q2 && x;
end
always @(posedge mclk) begin
	q1 = d1;
	q2 = d2;
end
assign cl = mclk;
endmodule
