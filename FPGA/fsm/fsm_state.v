// to implement finite state machine in verilog and also print the current state in a 7-segment display
module finitesm(input x,output y,cl,a,b,c,d,e,f,g);
reg q1,q2;
reg d1,d2;
initial begin
q1 = 0;
q2 = 0;
end
reg [28:0] delay;
wire clk;
reg mclk;
function automatic [6:0] gout;

	input [6:0] a;
begin 
	case(a)
	 0: gout = 7'b0000001;
	 1: gout = 7'b1001111;
	 2: gout = 7'b0010010;
	 3: gout = 7'b0000110;
	 4: gout = 7'b1001100;
	 5: gout = 7'b0100100;
	 6: gout = 7'b0100000;
	 7: gout = 7'b0001111;
	 8: gout = 7'b0000000;
	 9: gout = 7'b0001100;
	 default: gout = 7'b1111111;
	 endcase
end
endfunction
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
assign {a,b,c,d,e,f,g} = gout({d2,d1});
endmodule
