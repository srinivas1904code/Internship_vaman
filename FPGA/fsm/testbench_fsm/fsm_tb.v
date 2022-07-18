`timescale 10ns/10ps
module fsm_tb();
reg X,CLK;
wire CL,Y,D1,D2;
initial begin
X=0;
CLK =0;
end
finitesm dut(.x(X),.mclk(CLK),.y(Y),.d1(D1),.d2(D2));//module finitesm(input x,output y,cl,output reg d1,d2)
initial begin
#9 X =1;
#10 X=1;
#10 X=1;
#10 X=1;
#10 X=1;
#10 X=0;
#10 X=1;
#10 X=1;
end

always 
#5 CLK = !CLK;

initial begin
$dumpfile("fsm_tb.vcd");
$dumpvars(1,fsm_tb);
$monitor($time,"  X=%b,Y = %b,D2 =%b,D1 =%b",X,Y,D2,D1);
end
initial
#100 $finish;

endmodule
