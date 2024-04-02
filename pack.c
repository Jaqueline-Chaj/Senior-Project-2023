#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <windows.h>

int array[5][5] = {0};
int params[7];

void pack_values(int values[]){
    printf("inside pack values\n");
    long zero32 = 0;
    printf("x1: %d, y1: %d, x2: %d, y2: %d, color: %d, testpat: %d, eng_id: %d\n", values[0], values[1], values[2], values[3], values[4], values[5], values[6]);
    printf("x1 hex: %x\n", values[0] & 0x7FF);
    printf("y1 hex: %x\n", values[1] & 0x7FF);
    
    
    long coord1 = zero32 + (values[0] & 0x7FF) + ((values[1] & 0x7FF) << 11);
    printf("coord1: %x\n", coord1);
    zero32 = 0;
    long coord2 = zero32 | (values[2] & 0x7FF) | ((values[3] & 0x7FF) << 11);
    zero32 = 0;
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

    array[3][0] = 0x03;
    array[4][0] = 0x04;

    printf("array[0][0]: %x, array[0][1]: %x, array[0][2]: %x, array[0][3]: %x, array[0][4]: %x\n\n", array[0][0], array[0][1], array[0][2], array[0][3], array[0][4]);
    printf("array[1][0]: %x, array[1][1]: %x, array[1][2]: %x, array[1][3]: %x, array[1][4]: %x\n\n", array[1][0], array[1][1], array[1][2], array[1][3], array[1][4]);
    printf("array[2][0]: %x, array[2][1]: %x, array[2][2]: %x, array[2][3]: %x, array[2][4]: %x\n\n", array[2][0], array[2][1], array[2][2], array[2][3], array[2][4]);
    printf("array[3][0]: %x, array[3][1]: %x, array[3][2]: %x, array[3][3]: %x, array[3][4]: %x\n\n", array[3][0], array[3][1], array[3][2], array[3][3], array[3][4]);
    printf("array[4][0]: %x, array[4][1]: %x, array[4][2]: %x, array[4][3]: %x, array[4][4]: %x\n\n", array[4][0], array[4][1], array[4][2], array[4][3], array[4][4]);        
    Sleep(1000);
}

int main(int argc, char** argv){
    FILE* file = fopen("SQR_PARAMS.csv", "r");
    // csv has values in order: x1, y1, x2, y2, R, B, G
    char line[30];
    int values[7];

    while(fgets(line, sizeof(line), file)){
        char* token = strtok(line, ", ");
        int col = 0;

        while(token != NULL && col < 7){
            values[col] = atoi(token);
            col++;
            token = strtok(NULL,", ");
        }

    //once all values have been stored in array, print to verify
    //printf("x1: %d, y1: %d, x2: %d, y2: %d, R: %d, B: %d, G: %d\n", values[0], values[1], values[2], values[3], values[4], values[5], values[6]);
    pack_values(values);
    }


    fclose(file);
    return 0;
}
