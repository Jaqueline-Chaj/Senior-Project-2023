#include "project.h"
#include "stdio.h"

// Test comment to see commit changes 

void sendByte (int byte){

    OUT_BYTE_Write(byte);
    // switch (i){
    //     case 0: {(LEDreg_Write(0x00));
    //         break;}

}

void selectPayloadValue(stage){
    switch (stage){
        case 0: {
            //byte value selection and shift based on stage
            //
            break;
        }

    }

}

//function to map ADC (potentiometer) from 0 to 255 (11111111) 


int main(void)
{
    CyGlobalIntEnable; /* Enable global interrupts. */

    LCD_Start();
    LCD_ClearDisplay();
    
    char dispVal[1];
    char rcvdStatus[1];
    int breakflag = 0;
    int addr_flag = 0;
    int payload_flag = 0;
    int payload_bytes[4];
    int psoc_fpga_xfc = 0;  // state of output strobe
    int fpga_psoc_xfc = 0;  // state of input strobe
    H2G_STRB_OUT_Write(psoc_fpga_xfc);


    
    for(;;)
    {   
        addr_flag = 0;
        //conditions to break out of infinite for loop, to end program
        if (breakflag){
            break;
        }
        //button sets breakflag to 1 (true)
        if(!SW2_Read()){
            breakflag = 1;
            break;
        }

        LCD_Position(0,0);
        LCD_PrintString("RegWrite CMD");
        LCD_Position(1,0);
        LCD_PrintString("5 bytes total");

        CyDelay(750);
        
        LCD_ClearDisplay();
        
        int addrVal = 0;
        char dispString[2];
        
        LCD_Position(0,0);
        LCD_PrintString("Select an addr:");
        LCD_Position(1,0);
        LCD_PrintString("Addr:");
        //loop for user to select one of 8 registers to write to
        while(addr_flag != 1){
            if(!SW3_Read()){
                addr_flag = 1;
            }
            
            LCD_Position(1,5);
            sprintf(dispString, "%d", addrVal);
            LCD_PrintString(dispString);

            CyDelay(100);
            addrVal = addrVal + 1;
        }

        //small loop for user to select values for each payload byte, stored to be sent after all have been selected.
        for(int stage = 0; stage < 4; stage++){
            //selectPayloadValue function, taking stage as argument
        }    
        
        LCD_ClearDisplay();
    }
    
    LCD_Position(0,0);
    LCD_PrintString("Program Stopped");
}

/* [] END OF FILE */
