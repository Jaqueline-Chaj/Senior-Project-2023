#ifndef helper_functions_h
#define helper_functions_h

#include "project.h"
#include "stdio.h"

/*
Function to request values from user, for now it just sets the values explicitly.
*/
void req_user_values(int array[5][5]){
    array[0][0] = 0x00; //x1 and y1
    array[0][1] = 0xc8;
    array[0][2] = 0xb0;
    array[0][3] = 0x04;
    array[0][4] = 0x00;
    
    array[1][0] = 0x01;//x2 and y2
    array[1][1] = 0xee;
    array[1][2] = 0x52;
    array[1][3] = 0x14;
    array[1][4] = 0x00;
    
    array[2][0] = 0x02;//color
    array[2][1] = 0xe1;
    array[2][2] = 0x69;
    array[2][3] = 0x14;
    array[2][4] = 0x00;
    
    array[3][0] = 0x03;//test pat
    array[3][1] = 0x00;
    array[3][2] = 0x00;
    array[3][3] = 0x00;
    array[3][4] = 0x00;
    
    array[4][0] = 0x04;//end id
    array[4][1] = 0x00;
    array[4][2] = 0x00;
    array[4][3] = 0x00;
    array[4][4] = 0x00;
}

/*
Func 2
*/
void sendByte(int byte){
    OUT_BYTE_Write(byte);
}

/*
Func 3
*/
void reg_write(uint8_t bytes[5], int psoc_fpga_xfc, int fpga_psoc_xfc)
{
    // send each of the 5 bytes, wait until handshake is complete to return
    for(int i = 0; i < 5; i++){
        sendByte(bytes[i]);
        CyDelayCycles(1);
        psoc_fpga_xfc = 1 - psoc_fpga_xfc;
        H2G_STRB_OUT_Write(psoc_fpga_xfc);
        
        while(H2G_STRB_IN_Read() == fpga_psoc_xfc){
            //Idle until incoming handshake is toggled
        }
        CyDelayCycles(1);
        fpga_psoc_xfc = 1 - fpga_psoc_xfc;
    }
}

/*
Func 4
*/


#endif