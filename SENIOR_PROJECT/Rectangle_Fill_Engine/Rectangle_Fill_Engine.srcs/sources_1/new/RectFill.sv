

module RectFill (
input[23:0] foreground_color,
input start_trigger,
input clk, reset, 
input[10:0] lft, rgt,
input[9:0] top, bot,
output wr_en, 
output[19:0] waddr,
output[7:0] pixel_val

);

logic rect_state;

assign wr_en=rect_state;

//The states of the rectangle draw:  
logic rect_state_idle;   //Rectangle draw idle
logic rect_state_active; //Rectangle draw active


logic[10:0] marx;
logic[9:0] mary;
assign pixel_val[7:5]=foreground_color[23:21];
assign pixel_val[4:2]=foreground_color[15:13];
assign pixel_val[1:0]=foreground_color[7:6];

always_ff@(posedge clk) begin  //Sets the conditions for the state machine to progress

    if(reset)
        rect_state<=0;
    else  begin
        if(start_trigger)
            rect_state<=1;
        else if(marx==rgt && mary==bot)
            rect_state<=0;
    end
end

always_ff@(posedge clk) begin //Sets the actions at each state
if(reset || rect_state==0) begin
    marx<=lft; mary<=top; end
else 
    begin
        if(rect_state==1)
            if(marx<rgt)
                marx<=marx+1;
            else begin
                marx<=lft;
                mary<=mary+1;
            end
    end
end

//Helps assign the write address value for the vram
logic[11:0] y_logic;
assign y_logic=mary*5;
assign waddr={y_logic, 8'b0} + marx;

endmodule












