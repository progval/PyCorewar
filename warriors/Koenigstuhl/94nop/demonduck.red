;redcode-94
;name The Demon Duck of Doom
;author Christian Schmidt
;strategy Wallpaper without a qscanner
;assert 1

pstep1 	EQU 	2200
pstep2 	EQU 	3740
pstep3 	EQU 	3044
bstep1      EQU   2335

pHit 	equ  	7235

sStep 	equ  	598
sTime 	equ  	1698
sOff 	      equ  	7430

pGo     spl     1 		
        spl     1 		
        spl     1 		

pSilk0  spl     @0,      <pstep1
        mov     }-1,     >-1
        spl     @0,      <pstep2
        mov     }-1,     >-1
        spl     @0,      <pstep3
        mov     }-1,     >-1
        mov.i   #1,      <1
	  djn     -2,      <bstep1

	  for     13
        dat     0,       0
        rof

sSpl    spl     #0,      #0
sMov    mov     sBmb,    @sDjn
sInc    add     #sStep,  sDjn
sDjn    djn.f   sMov,    {sInc-(sTime*sStep)
sBmb    dat     >4,      >1

	  for     14
        dat     0,       0
        rof

bBoot   mov     sSpl,    sOff-6-CURLINE
        spl     2 ,      0
sDest   spl     2 ,      sOff-CURLINE
sSrc    spl     1 ,      sBmb+1
        mov     <sSrc,   <sDest
        djn     @bBoot,  #5
        jmp     pGo,     0

        end     bBoot

