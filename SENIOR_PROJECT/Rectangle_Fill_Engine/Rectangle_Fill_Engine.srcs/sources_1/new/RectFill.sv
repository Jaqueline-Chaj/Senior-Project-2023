

module RectFill (
input[23:0] foreground_color,
input start_trigger,
input clk, reset, 
input[10:0] lft, rgt,
input[9:0] top, bot,
output rect_wr_en, 
output[19:0] waddr,
output[7:0] rect_wr_data

);

logic rect_state;

logic [19:0] pace_counter;

always_ff @ (posedge clk)
begin
    if (reset)  pace_counter <=0;
    else        pace_counter <= pace_counter + 1;
end

//The states of the rectangle draw:  
logic rect_state_idle;   //Rectangle draw idle
logic rect_state_active; //Rectangle draw active


logic[10:0] marx;
logic[9:0] mary;
assign rect_wr_data[7:5]=foreground_color[23:21];
assign rect_wr_data[4:2]=foreground_color[15:13];
assign rect_wr_data[1:0]=foreground_color[7:6];

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
        if(rect_state==1 && pace_counter[11:0] == 0)
        begin
            if(marx<rgt)
                marx<=marx+1;
            else begin
                marx<=lft;
                mary<=mary+1;
            end
        end
    end
end

//Helps assign the write address value for the vram
logic[11:0] y_logic;
assign y_logic=mary*5;
assign waddr={y_logic, 8'b0} + marx;

assign rect_wr_en=rect_state;

endmodule












