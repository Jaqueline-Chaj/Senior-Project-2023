#include "project.h"
#include "stdio.h"

void cmd2byte (int i){
    switch (i){
        case 0: {(LEDreg_Write(0x00));
            break;}
            
        case 1: {(LEDreg_Write(0x01));
            break;}
            
        case 2: {(LEDreg_Write(0x02));
                break;}
            
        case 3: {(LEDreg_Write(0x03));
                break;}
            
        case 4: {(LEDreg_Write(0x04));
                break;}
            
        case 5: {(LEDreg_Write(0x05));
                break;}
            
        case 6: {(LEDreg_Write(0x06));
            break;}
        
        case 7: {(LEDreg_Write(0x07));
            break;}
            
        case 8: {(LEDreg_Write(0x08));
            break;}
            
        case 9: {(LEDreg_Write(0x09));
            break;}
            
        case 10:{(LEDreg_Write(0x0A));
            break;}
            
        case 11:{(LEDreg_Write(0x0B));
            break;}
            
        case 12:{(LEDreg_Write(0x0C));
            break;}
            
        case 13:{(LEDreg_Write(0x0D));
            break;}
            
        case 14:{(LEDreg_Write(0x0E));
            break;}
            
        case 15:{(LEDreg_Write(0x0F));
            break;}           
        }
    }

int main(void)
{
    CyGlobalIntEnable; /* Enable global interrupts. */

    LCD_Start();
    LCD_ClearDisplay();
    
    char dispVal[1];
    char rcvdStatus[1];
    int breakflag = 0;
    int psoc_fpga_xfc = 0;  // state of output strobe
    int fpga_psoc_xfc = 0;  // state of input strobe
    H2G_STRB_OUT_Write(psoc_fpga_xfc);

    LCD_Position(0,0);
    LCD_PrintString("Hex value:");
    LCD_Position(1,0);
    LCD_PrintString("Received?:");
    
    for(;;)
    {   
        //conditions to break out of infinite for loop, to end program
        if (breakflag){
            break;
        }
        for (int i = 0; i<16; i++){
            if(!SW2_Read()){
                breakflag = 1;
                break;
            }
            //First, write data
            cmd2byte(i);

            sprintf( dispVal, "%x", i);
            LCD_Position(0, 11);
            LCD_PrintString(dispVal);
            //Delay of 1 clock cycle before toggling H2G_STRB_OUT on
            CyDelayCycles(1);          

            // Second, toggle strobe
            psoc_fpga_xfc = 1-psoc_fpga_xfc;
            H2G_STRB_OUT_Write(psoc_fpga_xfc);

            // Idle, until strobe toggles
            while(H2G_STRB_IN_Read() == fpga_psoc_xfc){
                sprintf( rcvdStatus, "%d", H2G_STRB_IN_Read());
                LCD_Position(1, 11);
                LCD_PrintString(rcvdStatus);
            }

            fpga_psoc_xfc = 1-fpga_psoc_xfc;
            LCD_Position(1, 11);
            sprintf( rcvdStatus, "%d", H2G_STRB_IN_Read());
            LCD_PrintString(rcvdStatus);

            // 1 second delay until sending next number (byte in general)
            CyDelay(1000);
        }
    }
    
    LCD_Position(0,0);
    LCD_PrintString("Program Stopped");
}

/* [] END OF FILE */
