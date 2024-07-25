module tb();
reg clk_i, reset_i, data_i;
wire match_o;
fsm pd0(.*);
initial
begin
	$dumpfile("sample.vcd");
	$dumpvars;
	clk_i = 1'd0;
	forever #5 clk_i = ~clk_i;
end

initial
begin
#0 reset_i <= 1'd1;
#5 reset_i <= 1'd0;
data_i <= 1'd0;
#10 reset_i <= 1'd1;
#10;
#10 data_i <= 1'd0;
#10 data_i <= 1'd1;
#10 data_i <= 1'd0;
#10 data_i <= 1'd0;
#10 data_i <= 1'd1;
#10 data_i <= 1'd0;
#10 data_i <= 1'd1;
#10 data_i <= 1'd1;
#10 data_i <= 1'd0;
#10 data_i <= 1'd1;
#20;
$finish;
end
endmodule

