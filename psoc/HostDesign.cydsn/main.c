#include "project.h"
#include "stdio.h"
#include "SQR_PARAMS.h"


int psoc_fpga_xfc;  // state of output strobe
int fpga_psoc_xfc;  // state of input strobe
int x1, y1, x2, y2, r, b, g = 0;
uint8_t array[5][5] = {0};
//int x1, y1, x2, y2, fill_color, test_pat_mode, engine_id; //values required for commands
long color = 0; 
int demo_mode = 0;

void pack_values(int values[]){ //pack values for rect, pixel, circle, and line demos. Image demo will need another pack function for just 8bit color
    long zero32 = 0;
    long coord1 = zero32 | (values[0] & 0x7FF) | ((values[1] & 0x7FF) << 11);
    long coord2 = zero32 | (values[2] & 0x7FF) | ((values[3] & 0x7FF) << 11);
    long color = zero32 | (values[6] & 0xFF) | ((values[5] & 0xFF) << 8) | ((values[4] & 0xFF) << 16);
    

    array[0][0] = 0x00; //reg addr
    array[0][1] = coord1 & 0xFF;   //bottom byte
    array[0][2] = (coord1 >> 8) & 0xFF;   //next byte
    array[0][3] = (coord1 >> 16) & 0xFF;   //
    array[0][4] = (coord1 >> 24) & 0xFF;   //top byte

    array[1][0] = 0x01; //reg addr
    array[1][1] = coord2 & 0xFF;   //bottom byte
    array[1][2] = (coord2 >> 8) & 0xFF;   //next byte
    array[1][3] = (coord2 >> 16) & 0xFF;   //
    array[1][4] = (coord2 >> 24) & 0xFF;   //top byte

    array[2][0] = 0x02; //reg addr
    array[2][1] = color & 0xFF;   //bottom byte
    array[2][2] = (color >> 8) & 0xFF;   //next byte
    array[2][3] = (color >> 16) & 0xFF;   //
    array[2][4] = (color >> 24) & 0xFF;   //top byte

    array[3][0] = 0x03; //just set addr byte of test pat and engine_id right now.
    
    array[4][0] = 0x04; //Engine ID register address
    if(demo_mode == 0 || demo_mode == 1 || demo_mode == 2){
        array[4][1] = 0x00; //rectangle engine used for rect, pixel, circle demos
    }
    else if(demo_mode == 3){ //line engine used for line demo
        array[4][1] = 0x01; //Engine ID value (bottom byte 7:0)
    }
    array[4][2] = 0x00; //Engine ID value (bottom byte 15:8)
    array[4][3] = 0x00; //Engine ID value (bottom byte 23:16)
    array[4][4] = 0x00; //Engine ID value (bottom byte 31:24)
}


void sendByte(uint8_t byte){
    OUT_BYTE_Write(byte);
}

void reg_write(uint8_t bytes[5])
{
    char byteDispStr[16];
    // send each of the 5 bytes, wait until handshake is complete to return
    for(int i = 0; i < 5; i++){
        sendByte(bytes[i]);
        psoc_fpga_xfc = 1 - psoc_fpga_xfc;
        H2G_STRB_OUT_Write(psoc_fpga_xfc);
        
        while(H2G_STRB_IN_Read() == fpga_psoc_xfc){
            //Idle until incoming handshake is toggled
        }
        fpga_psoc_xfc = 1 - fpga_psoc_xfc;
    }
}


int main(void)
{
    int row_idx = 0;
    int maxrows = 0;
    CyGlobalIntEnable; /* Enable global interrupts. */

    LCD_Start();
    LCD_ClearDisplay();
    
    char dispStr[16];
    char dispStr2[16];

    psoc_fpga_xfc = 0;  // state of output strobe
    fpga_psoc_xfc = 0;  // state of output strobe
    
    //Send reset signal to Nexys board
    CyDelay(100);
    PSOC_RESET_RAW_Write(1);
    CyDelay(300);
    PSOC_RESET_RAW_Write(0);
    CyDelay(100);
    
    //write initial handshake to Nexys FPGA.
    H2G_STRB_OUT_Write(psoc_fpga_xfc);
    
    char line[30];
    int values[7];
    int loop = 0;
    int trns_idx = 45;
    int wait_for_press = 0;
    for(;;)
    {   

        if(demo_mode == 0){
            maxrows = 3; //however many rectangles we will draw
            //CyDelay(50);
            for (int idx=0; idx < 7; ++idx)
                values[idx]=squares_dat_linear_rect_demo[row_idx * 7 + idx];   
        }
        else if(demo_mode == 1){
            maxrows = 4; //however many pixels we will draw
            //CyDelay(50);
            for (int idx=0; idx < 7; ++idx)
                values[idx]=squares_dat_linear_pixel_demo[row_idx * 7 + idx];              
        }
        else if(demo_mode == 2){
            maxrows = 360; //number of squares to draw for each circle
            //CyDelay(50);
            for (int idx=0; idx < 7; ++idx)
                values[idx]=squares_dat_linear_circle_demo[row_idx * 7 + idx];              
        }
        else if(demo_mode == 3){
            maxrows = 724; //however many lines we will draw
            //CyDelay(50);
            for (int idx=0; idx < 7; ++idx)
                values[idx]=squares_dat_linear_line_demo[row_idx * 7 + idx];              
        }               

        // area to set color data procedurally for demo_mode == 2 (circle)
        if(demo_mode == 2){
            if(loop == 0){ //R
                values[6] = 0; //g
                values[5] = 0;  //b
                values[4] = 0xd1;  //r
            }
            if(loop == 1){  //O
                values[6] = 0x66; //g
                values[5] = 0x22;  //b
                values[4] = 0xff;  //r
            }
            if(loop == 2){ // Y
                values[6] = 0xda; //g
                values[5] = 0x21;  //b
                values[4] = 0xff;  //r
            }
            if(loop == 3){ //G
                values[6] = 0xdd; //g
                values[5] = 0x00;  //b
                values[4] = 0x33;  //r
            }
            if(loop == 4){ //B
                values[6] = 0x33; //g
                values[5] = 0xcc;  //b
                values[4] = 0x11;  //r
            }            
            if(loop == 5){ //I
                values[6] = 0x00; //g
                values[5] = 0x66;  //b
                values[4] = 0x22;  //r
            }            
            if(loop == 6){ //V
                values[6] = 0x00; //g
                values[5] = 0x44;  //b
                values[4] = 0x33;  //r
            }            
            if(loop == 7){ //Purple
                values[6] = 0x00; //g
                values[5] = 0x99;  //b
                values[4] = 0x99;  //r
            }               
            if(loop == 8){ //white
                values[6] = 0xff; //g
                values[5] = 0xff;  //b
                values[4] = 0xff;  //r
            }  
        }

        pack_values(values); //pack values into array[][]
        
        if(demo_mode == 2){
            if(row_idx == 359 || row_idx == trns_idx || row_idx == trns_idx*2 || row_idx == trns_idx*3 || row_idx == trns_idx*4 || row_idx == trns_idx*5 || row_idx == trns_idx*6 || row_idx == trns_idx*7){
                loop = (loop + 1) % 9;
            }   
        }
        if(demo_mode == 0 || demo_mode == 1 || demo_mode == 3){
            row_idx = row_idx + 1;   //increment row index for demos 0, 1, 3
        }
        else if(demo_mode == 2){
            row_idx = (row_idx + 1) % maxrows;   //circularly increment row_idx for circle
        }


        for(int i = 0; i < 5; i++){
            reg_write(array[i]);
        }
        if(row_idx == maxrows){ wait_for_press = 1;}
        while(wait_for_press){
            if(!SW2_Read()){ //if SW2 is pressed, change demo mode
                CyDelay(100);
                wait_for_press = 0;
                demo_mode = (demo_mode + 1) % 4; //move to next demo mode
                row_idx = 0; //set row_idx back to 0 for next demo
                
                
                for (int idx=0; idx < 7; ++idx)
                    values[idx]=clear_screen_dat[row_idx * 7 + idx];
                    
                pack_values(values);
                for(int i = 0; i < 5; i++){
                    reg_write(array[i]); //clear screen by displaying black box
                }
                CyDelay(100);
            }
        }
        if(!SW2_Read()){ //polling for when in demo mode 2 (circle)
            CyDelay(100);
            row_idx = 0; //set row_idx back to 0 for next demo
            int current_demo = demo_mode;
                
            demo_mode = 0;
            for (int idx=0; idx < 7; ++idx)
                values[idx]=clear_screen_dat[row_idx * 7 + idx];
                    
            pack_values(values);
            for(int i = 0; i < 5; i++){
                reg_write(array[i]); //clear screen by displaying black box
            }
            demo_mode = (current_demo + 1) % 4; //move to next demo mode
            CyDelay(100);
        }        
        if(demo_mode == 3){
            CyDelayUs(40000); //to show line by line drawing
        }
        else{
            CyDelayUs(250); //to print circle at a moderate speed
        }               
    }
        
}