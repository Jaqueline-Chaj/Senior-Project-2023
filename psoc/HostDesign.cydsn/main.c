#include "project.h"
#include "stdio.h"
#include "SQR_PARAMS.h"


int psoc_fpga_xfc;  // state of output strobe
int fpga_psoc_xfc;  // state of input strobe

uint8_t array[5][5] = {0};
int params[7];

uint8_t rect_full[5][5] = {0};
//int x1, y1, x2, y2, fill_color, test_pat_mode, engine_id; //values required for commands

void pack_values(int values[]){
    //printf("inside pack values\n");
    long zero32 = 0;
    //printf("x1: %d, y1: %d, x2: %d, y2: %d, color: %d, testpat: %d, eng_id: %d\n", values[0], values[1], values[2], values[3], values[4], values[5], values[6]);
    //printf("x1 hex: %x\n", values[0] & 0x7FF);
    //printf("y1 hex: %x\n", values[1] & 0x7FF);
    
    long coord1 = zero32 | (values[0] & 0x7FF) | ((values[1] & 0x7FF) << 11);
    //printf("coord1: %x\n", coord1);
    long coord2 = zero32 | (values[2] & 0x7FF) | ((values[3] & 0x7FF) << 11);
    long color = zero32 | (values[4] & 0xFF) | ((values[5] & 0xFF) << 8) | ((values[6] & 0xFF) << 16);
    long tmp[3] = {coord1, coord2, color};

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
    array[4][0] = 0x04;
}




void sendByte(uint8_t byte){
    OUT_BYTE_Write(byte);
}

void reg_write(uint8_t bytes[5])
{
    char byteDispStr[16];
    // send each of the 5 bytes, wait until handshake is complete to return
    for(int i = 0; i < 5; i++){
        LCD_Position(0,0);
        LCD_ClearDisplay();
        sprintf(byteDispStr, "Sending byte %d", i);
        LCD_PrintString(byteDispStr);
        sendByte(bytes[i]);
        CyDelayCycles(1);
        psoc_fpga_xfc = 1 - psoc_fpga_xfc;
        H2G_STRB_OUT_Write(psoc_fpga_xfc);
        
        while(H2G_STRB_IN_Read() == fpga_psoc_xfc){
            //Idle until incoming handshake is toggled
        }
        CyDelayCycles(1);
        fpga_psoc_xfc = 1 - fpga_psoc_xfc;
        LCD_Position(0,0);
        LCD_ClearDisplay();
        sprintf(byteDispStr, "Byte %d rcvd", i);
        LCD_PrintString(byteDispStr);
    }
}


int main(void)
{
    int row_idx = 0;

    CyGlobalIntEnable; /* Enable global interrupts. */

    LCD_Start();
    LCD_ClearDisplay();
    
    char dispStr[16];
    char rcvdStatus[1];

    
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
    
    //open file
    //open csv file of rectangle data
//    FILE* file = fopen("SQR_PARAMS.csv", "r");
    // csv has values in order: x1, y1, x2, y2, R, B, G
    char line[30];
    int values[7];


    for(;;)
    {    
        LCD_Position(0,0);
        LCD_PrintString("Rect CMD Test");
        CyDelay(1000);
        
        
//        while(fgets(line, sizeof(line), file)){
//        char* token = strtok(line, ", ");
//        int col = 0;
//
//        while(token != NULL && col < 7){
//            values[col] = atoi(token);
//            col++;
//            token = strtok(NULL,", ");
//        }
            for (int idx=0; idx < 7; ++idx)
                values[idx]=squares_dat_linear[row_idx * 7 + idx];
                
            //once all values have been stored in array, print to verify
            //printf("x1: %d, y1: %d, x2: %d, y2: %d, R: %d, B: %d, G: %d\n", values[0], values[1], values[2], values[3], values[4], values[5], values[6]);
            pack_values(values);
            row_idx = (row_idx + 1) % 360;
            
            
            LCD_ClearDisplay();
            LCD_PrintString("About to send arrays");
        
            for(int i = 0; i < 5; i++){
                LCD_ClearDisplay();
                sprintf(dispStr, "Sending array %d", i);
                LCD_PrintString(dispStr);
                CyDelay(500);
                reg_write(array[i]);
                CyDelay(500);
            }
                
            CyDelay(500);
        
        
        //LCD_ClearDisplay();
        //LCD_PrintString("Full cmd sent!");
        
        //CyDelay(2000);
    }
    

}
