`define CMD_REG (0000)

module RectFill (
input logic reg_wr_en,clk,reset,
input[3:0] reg_addr_dat,
input[31:0] command_reg,
input[15:0] top,left,bot,right,
input[31:0] color_reg,
input[4:0] reg_addr

);
logic[30:0] command;

//The states of the rectangle draw:  
logic rect_state_idle;   //Rectangle draw idle
logic rect_state_active; //Rectangle draw active
logic cur_rect_state;    //Current rectangle fill state
logic nx_rect_state;     //Next rectangle fill state
logic[19:0] marx;
logic[11:0] mary;

always_ff@(posedge clk) begin

if(reset)
cur_rect_state<=rect_state_idle;
else if(reg_wr_en && `CMD_REG==reg_addr  &&reg_dat[0])
cur_rect_state<=rect_state_active;
else if(marx==right && mary==bot)
cur_rect_state<=rect_state_idle;


end














endmodule