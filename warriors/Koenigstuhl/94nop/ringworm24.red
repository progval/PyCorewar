;redcode-b
;assert CORESIZE==8000
;name RingWorm_v2.4
;author Calvin Loh
;strategy 13-point imp ring/spiral(?) with 39 processes( JMP-ADD launch )
STEP    equ     3077    
TSTEP   equ     2667
CSTEP   equ     1143
NSTEP   equ     5091
RANGE   equ     2353
imp     mov     imp,    imp + STEP
start   spl     1
        mov     -1,     0
        mov     -1,     0
        spl     1
        spl     1
        mov     -1,     0
launch  spl     2
        jmp     @0,     imp
        add.ab  #STEP,  -1
tim2    spl     @tim2, }TSTEP      
tim2a   mov.i   }tim2,  >tim2 
cel2    spl     @cel2,  }CSTEP  ;these four lines are the main body
cel2a   mov.i   }cel2,  >cel2
        mov.x   <-RANGE,>RANGE  ;here you can insert some bombing line
ncl2a   mov.i   {cel2,  <ncl2
ncl2    jmp     @ncl2,  >NSTEP
        end     start
