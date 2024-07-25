module fsm
(
	input clk_i,
	input reset_i,
	input data_i,
	output reg match_o
);

parameter IDLE 	= 1'd0;
parameter S1	= 1'd1;

reg next_state;
reg curr_state;

always@(posedge clk_i or negedge reset_i)
begin
	if(!reset_i)
	curr_state <= 2'd0;
	else
	curr_state <= next_state;
end

always@ *
begin
match_o = 1'd0;
next_state = IDLE;
case (curr_state)
	IDLE:
	if(data_i)
		next_state = S1;
	S1:
	begin
	if(data_i)
		next_state = S1;
	else
		match_o = 1'd1;
	end
endcase
end
endmodule
