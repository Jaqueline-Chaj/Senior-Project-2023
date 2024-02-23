#include "project.h"
#include "stdio.h"


uint cmdBytes[5];

//Method to write a byte value to the output port
void sendByte(int byte){
    OUT_BYTE_Write(byte);
}

//Method to set the values for each of the payload bytes
void selectPayloadValue(stage){
    LCD_ClearDisplay();
    LCD_Position(0,0);
    if(stage == 1){
    LCD_PrintString("Set b7:0 ");   
    }
    else if(stage == 2){
    LCD_PrintString("Set b15:8 ");
    }
    else if(stage == 3){
    LCD_PrintString("Set b23:16 ");
    }
    else{
    LCD_PrintString("Set b31:24 ");
    }
    
    LCD_Position(1,0);
    LCD_PrintString("Value:");
    
    char dispStr[2];
    char setMsg[16];
    int selected = 0;
    int byteVal = 0x00;
    
    while(selected != 1){
        if(!SW3_Read()){
            selected = 1;
        }
        
        LCD_Position(1,6);
        sprintf(dispStr, "%x", byteVal);
        LCD_PrintString(dispStr);
        CyDelay(100);
    
        if(stage == 1){
            byteVal = 0x02;
        }
        else if (stage == 2){
            byteVal = 0x04;
        }    
        else if (stage == 3){
            byteVal = 0x06;        
        }
        else{
            byteVal = 0x08;
        }
    }

    if(stage == 1){
        cmdBytes[1] = byteVal;    
    }
    else if(stage == 2){
        cmdBytes[2] = byteVal;
    }
    else if(stage == 3){
        cmdBytes[3] = byteVal;
    }
    else{
        cmdBytes[4] = byteVal;
    }
    
    LCD_ClearDisplay();
    LCD_Position(0,0);
    sprintf(setMsg, "Byte%d value set.", stage);
    LCD_PrintString(setMsg);
    LCD_Position(1,0);
    LCD_PrintString("Value:");
    LCD_Position(1,6);
    sprintf(dispStr, "%x", byteVal);
    LCD_PrintString(dispStr);
    CyDelay(1000);
}

void reg_write( uint8_t bytes[8] )
{
    // send each of the 5 bytes, wait until handshake is complete to return
}

int main(void)
{
    CyGlobalIntEnable; /* Enable global interrupts. */

    LCD_Start();
    LCD_ClearDisplay();
    
    char dispVal[1];
    char rcvdStatus[1];

    int addr_flag = 0;
    int psoc_fpga_xfc = 0;  // state of output strobe
    int fpga_psoc_xfc = 0;  // state of input strobe
    
    //Send reset signal to Nexys board
    PSOC_RESET_RAW_Write(1);
    CyDelay(100);
    PSOC_RESET_RAW_Write(0);
    CyDelay(100);
    
    //write initial handshake to Nexys FPGA.
    H2G_STRB_OUT_Write(psoc_fpga_xfc);

    //SW2 used for selection of data
    //SW3 used to progress to next stage
    
    for(;;)
    {   
        addr_flag = 0;
        
        LCD_ClearDisplay();
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
            sprintf(dispString, "%x", addrVal);
            LCD_PrintString(dispString);

            addrVal = 0x00;  //setting explicitly for testing fpga
            /*
            CyDelay(100);
            
            if( addrVal == 15){
                addrVal = 0x00;
            }
            else{
            addrVal = addrVal + 1;
            }
            */
        }
        cmdBytes[0] = addrVal;
        
        LCD_ClearDisplay();
        LCD_Position(0,0);
        LCD_PrintString("Address set.");
        LCD_Position(1,0);
        LCD_PrintString("Address:");
        sprintf(dispString, "%x", cmdBytes[0]);
        LCD_Position(1,8);
        LCD_PrintString(dispString);
        CyDelay(1000);
        
        //small loop for user to select values for each payload byte, stored to be sent after all have been selected.
        for(int stage = 1; stage <5; stage++){
            //selectPayloadValue function, taking stage as argument
            selectPayloadValue(stage);
        }    
        LCD_ClearDisplay();
        
        while(SW3_Read()){
        LCD_Position(0,0);
        LCD_PrintString("CMD to be sent: ");
        LCD_Position(1,0);
        LCD_PrintHexUint8(cmdBytes[0]);
        LCD_Position(1,3);
        LCD_PrintHexUint8(cmdBytes[4]);
        LCD_Position(1,6);
        LCD_PrintHexUint8(cmdBytes[3]);
        LCD_Position(1,9);
        LCD_PrintHexUint8(cmdBytes[2]);
        LCD_Position(1,12);
        LCD_PrintHexUint8(cmdBytes[1]);
        CyDelay(1000);
        LCD_Position(0,0);
        LCD_PrintString("Addr,B4,B3,B2,B1");
        CyDelay(1000);
        }
        

        LCD_Position(0,0);
        LCD_PrintString("Sending addr... ");
        
        //write bytes to output
        //send CMDcode/addrss byte first, then loop through payload bytes to send correctly
        sendByte(cmdBytes[0]);
        CyDelayCycles(1);
        psoc_fpga_xfc = 1 - psoc_fpga_xfc;
        H2G_STRB_OUT_Write(psoc_fpga_xfc);
        
        while(H2G_STRB_IN_Read() == fpga_psoc_xfc){
            //Idle until incoming handshake is toggled
        }
        CyDelayCycles(1);
        fpga_psoc_xfc = 1 - fpga_psoc_xfc;
        

        LCD_Position(0,0);
        LCD_PrintString("Addr received");
        CyDelay(500);
        LCD_Position(0,0);
        LCD_PrintString("Sending payload...");
        for(int i = 1 ; i <5; i++){
            sendByte(cmdBytes[i]); 
            
            
            psoc_fpga_xfc = 1 - psoc_fpga_xfc;
            H2G_STRB_OUT_Write(psoc_fpga_xfc);
        
            while(H2G_STRB_IN_Read() == fpga_psoc_xfc){
            //Idle until incoming handshake is toggled
            }
            fpga_psoc_xfc = 1 - fpga_psoc_xfc;
        }
        
        LCD_ClearDisplay();
        LCD_PrintString("Command sent!");
        CyDelay(2000);
        
    }
    

}
