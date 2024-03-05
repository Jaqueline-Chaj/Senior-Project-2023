#include "project.h"
#include "stdio.h"
#include "helper_functions.c"

int psoc_fpga_xfc;  // state of output strobe
int fpga_psoc_xfc;  // state of input strobe

int *rect_full[5][5];
int x1, y1, x2, y2, fill_color, test_pat_mode, engine_id; //values required for commands

int main(void)
{
    CyGlobalIntEnable; /* Enable global interrupts. */

    LCD_Start();
    LCD_ClearDisplay();
    
    char dispVal[1];
    char rcvdStatus[1];

    int addr_flag = 0;
    psoc_fpga_xfc = 0;  // state of output strobe
    fpga_psoc_xfc = 0;  // state of output strobe
    
    
    //Send reset signal to Nexys board
    CyDelay(100);
    PSOC_RESET_RAW_Write(1);
    CyDelay(100);
    PSOC_RESET_RAW_Write(0);
    CyDelay(100);
    
    //write initial handshake to Nexys FPGA.
    H2G_STRB_OUT_Write(psoc_fpga_xfc);
    
    //manually set defatult Stest rectangle payloads to draw a rectangle with coords (200, 150) and (750, 600), color Royal Blue
    req_user_values(&rect_full[5][5]);
    
    for(;;)
    {   
        x1 = 0; //reset all user values to 0 before a new command is parsed.
        y1 = 0;
        x2 = 0;
        y2 = 0;
        fill_color = 0;
        test_pat_mode = 0;
        engine_id = 0; 
        int word32_count = 0;
        
        //get command type from user.
        engine_id = 0x0; //update to let user choose via knob, always rect command right now
        
        //get values from user, stored in global vars.
        
        //while(word32_cnt < 5){
            //pack into specific row of 2d array
        //}
        
        //display all values given by user and "ready to send" msg
        
        //wait for button press
        
        //on button press
            //iterate over each row and send each 

        
        //write bytes to output
        //send CMDcode/adderss byte first, then loop through payload bytes to send correctly

        
        LCD_ClearDisplay();
        LCD_PrintString("Command sent!");
        CyDelay(2000);
    }
    

}
