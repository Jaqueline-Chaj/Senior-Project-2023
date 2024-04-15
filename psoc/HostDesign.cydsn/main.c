#include "project.h"
#include "stdio.h"
#include "SQR_PARAMS.h"


int psoc_fpga_xfc;  // state of output strobe
int fpga_psoc_xfc;  // state of input strobe
int x1, y1, x2, y2, r, b, g = 0;
uint8_t array[5][5] = {0};
//int x1, y1, x2, y2, fill_color, test_pat_mode, engine_id; //values required for commands
long color = 0; 

void pack_values(int values[]){
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
    array[4][1] = 0x01; //Engine ID value (bottom byte 7:0)
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
    CyDelay(100);
    PSOC_RESET_RAW_Write(0);
    CyDelay(100);
    
    //write initial handshake to Nexys FPGA.
    H2G_STRB_OUT_Write(psoc_fpga_xfc);
    
    char line[30];
    int values[7];

    for(;;)
    {    
        for (int idx=0; idx < 7; ++idx)
            values[idx]=squares_dat_linear[row_idx * 7 + idx];                 
            
        pack_values(values); //pack values for square into array[][]

        row_idx = (row_idx + 1); //increment row index to read
        
        for(int i = 0; i < 5; i++){
            reg_write(array[i]);
        }
        if(row_idx == 1){ break;}
        CyDelayUs(1);
               
    }
        
}
