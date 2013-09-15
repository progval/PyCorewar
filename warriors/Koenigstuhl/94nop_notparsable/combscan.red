;redcode
;name Comb Scan
;author Steve Gunnell
;strategy Reducing step scan segueing to a d-clear.
;strategy Changed from a f-scanner to a b-scanner so I could use
;strategy the a-field to decoy Stylized Euphoria's silk imps
;strategy away from the stunned papers.
;assert 1

; Constants being played with by the optimizer
STEP    equ    581
DIVS    equ    8
STOP    equ    16
OFFS    equ    719
DCNT    equ    0
DBMB    equ    dat  0, 10
SAFE    equ    bomb-bptr+5
SCNT    equ    5
EUPH    equ    7

bptr    dat.f  0        ,0
        dat.f  0        ,0
ptr     dat.f  STEP     ,OFFS
        dat.f  0        ,0
        dat.f  0        ,0
clear   mov.i  clrb     ,ptr
        spl    #0       ,>ptr
        mov.i  clrb     ,>ptr
for DCNT
        mov.i  clrb     ,>ptr
rof
        djn.f  -1       ,>ptr
clrb    DBMB
chop    div.a  #DIVS    ,ptr
        slt.a  #STOP    ,ptr
        jmp    clear
step    add.ab ptr      ,ptr
enter   jmz.b  step     ,@ptr
        slt.ab #SAFE    ,ptr
        jmp    chop
        mov.b  ptr      ,bptr
trash   mov.i  bomb     ,>bptr
for SCNT
        mov.i  bomb     ,>bptr
rof
        jmn.f  trash    ,@bptr
        jmp    step
bomb    spl    #EUPH    ,#0

end enter

