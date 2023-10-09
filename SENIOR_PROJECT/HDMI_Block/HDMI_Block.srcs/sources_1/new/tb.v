`timescale 1ns / 1ps


module tb();
logic PixelClk,resetn,SerialClk;

//DIGILENT PORTS


logic TMDS_Clk_p;
logic TMDS_Clk_n;
logic[2:0] TMDS_Data_p;
logic[2:0] TMDS_Data_n;

/* input  */ logic aRst;   // --asynchronous reset; must be reset when RefClk is not within spec

/* input  */ logic aRst_n; // --asynchronous reset; must be reset when RefClk is not within spec

/*        */   // Video in

/* input  */ logic [23:0] vid_pData ;
/* input  */ logic vid_pVDE  ;
/* input  */ logic vid_pHSync;
/* input  */ logic vid_pVSync;
  


Display_Gen_Digilent disp_gen (


.TMDS_Clk_p (TMDS_Clk_p ),     

 .TMDS_Clk_n (TMDS_Clk_n ),

.TMDS_Data_p(TMDS_Data_p),

.TMDS_Data_n(TMDS_Data_n),

.resetn(resetn),

.PixelClk   (PixelClk   )

//.SerialClk  (SerialClk  )

);


int i=0;
initial begin
PixelClk=1;
for(i=0; i<2147483647; i=i+1) 
    #6.73 PixelClk=~PixelClk;
$finish;
end

int k=0;
initial begin
SerialClk=1;
for(k=0; k<2147483647; k=k+1) 
    #1.346 SerialClk=~SerialClk;
$finish;
end

initial begin
resetn=1;
#100 resetn=0;
end
endmodule
