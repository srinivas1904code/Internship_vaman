// write a verilog program to implement a decade up counter using vaman and 7-segment display
module decade(output a,output b,output c,output d,output e,output f ,output g);
reg[27:0] delay;
integer i;
wire clk;
qlal4s3b_cell_macro u_qlal4s3b_cell_macro (
        .Sys_Clk0 (clk),);
function automatic [6:0] gpio_out;
input [3:0] num_i;

begin
    case (num_i)  
        0 : gpio_out = 7'b0000001;
        1 : gpio_out = 7'b1001111;
        2 : gpio_out = 7'b0010010;
        3 : gpio_out = 7'b0000110;
        4 : gpio_out = 7'b1001100;
        5 : gpio_out = 7'b0100100;
        6 : gpio_out = 7'b0100000;
        7 : gpio_out = 7'b0001111;
        8 : gpio_out = 7'b0000000;
        9 : gpio_out = 7'b0000100;
default : gpio_out = 7'b1111111; 
    endcase
end
endfunction
always@(posedge clk) begin
	delay=delay+1;
	if(delay > 20000000)
		begin
		delay =0;
		if(i==9) 
			begin 
			i=0 ;
			end 
		else begin
			i=i+1 ;
		end
	end
end
assign {a,b,c,d,e,f,g} = gpio_out(i);
endmodule
