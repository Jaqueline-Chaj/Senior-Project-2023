#include "project.h"
#include "stdio.h"

    void val2segs (int i){
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

    /* Place your initialization/startup code here (e.g. MyInst_Start()) */
    LCD_Start();
    LCD_ClearDisplay();
    
    char dispMsg[] = "Hex value: ";
    char dispVal[1];
    int breakflag = 0;
    
    LCD_Position(0,0);
    LCD_PrintString(dispMsg);
    
    for(;;)
    {
        if (breakflag){
            break;
        }
        for (int i = 0; i<16; i++){
            if(!SW2_Read()){
                CyDelay(50);
                breakflag = 1;
                CyDelay(50);
            }
            if(breakflag){
                break;
            }
            //writes hex value to the "port" (LEDs for now)
            val2segs(i);
            //toggles out handshake to 1 to tell nexys that data is valid
            H2G_STRB_OUT_Write(1);
            //should this stay on until strb_in is toggled on? aka continuously send the same valid data until received
            
            sprintf( dispVal, "%x", i);
            LCD_Position(0, 11);
            LCD_PrintString(dispVal);
            CyDelay(1000);   
        } 
        /* Place your application code here. */
    }
    
    LCD_Position(0,0);
    LCD_PrintString("Program Stopped");
}

/* [] END OF FILE */
