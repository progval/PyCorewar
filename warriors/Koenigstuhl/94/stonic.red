;redcode-94
;name stoninc
;author Maurizio
;assert CORESIZE==8000
;strategy decoy test

DIST    equ     4200

decA    equ     (start+DIST-2500)
dAUX    equ     201
decAA   equ     (start+DIST+750)


;       *  *  *   P I T   *  *  *

;any silk-like warrior here is welcome! ;-)

pit     spl     16*2,   <pit-50
i for   16
        stp     #0,     #(-3*i*i)
        spl     -2,     <-1
rof
        jmp     -1,     <pit-50
i for   15
        stp     #0,     #(-3*i*i+1)
        spl     -2,     <-1
rof
        jmp     -1,     <pit-50


;       * * *  D E C O Y - M A K E R  +  B O O T  * * *

;the goal is trash A and B field, and try to damage the enemy

decoy1
b for   6
        mov     <decA+1-dAUX*(decoy1+1),{decA-dAUX*decoy1
rof

decoy2
b for   6
        mov     <decAA+1-dAUX*(decoy2+1),{decAA-dAUX*decoy2
rof

boot
a for   7
        mov     {bptr1, <bptr1
rof
        mov     wipe,   {bptr2
        mov     gate,   {bptr2
        mov     sm,     <bptr2
        spl     @bptr1, <4763


bptr1   div.x   #cp+1,  #DIST
bptr2   div.x   #DIST-9,#DIST+3


;       *  *  *   B O M B E R   *  *  *

;Brand 3.3
;by Robert MacRae

STEP1   equ     899
STEP2   equ     902

gate    dat   -100,     200
wipe    dat     -2,     #cp-gate+2
;       1 DAT
start   spl     #STEP2, STEP2+1
msm     mov     sm+3,   *(tgt+2*STEP1+STEP2)
msp     mov     start,  @msm
in      add     #STEP1+STEP2,@msp
tgt     djn.f   msm,    <4502
clr     mov     wipe-1, >gate-1
cp      djn.f   clr,    {gate-1
;       3 DAT
sm      mov     -STEP2, >-STEP2

end     decoy1
