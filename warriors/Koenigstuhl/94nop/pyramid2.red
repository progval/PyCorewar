;redcode-94
;name Pyramid v2.0
;author Michael Constant
;strategy  quick-vamp -> vampire
;macro
;assert 1

; ----------------- Quick-Scan Parameters --------------------
OVERLAP1 equ    30
OVERLAP2 equ    0
BIGSTEP equ     100
OFFSET  equ     150
BOMBDIR equ     1            ; 1 is forward, -1 is backward
SPACE   equ     6            ; must be even
; ------------------------------------------------------------

STEP    equ     3364

first   mov     wimp,   wimp+22
        spl     wimp+22
        jmp     split
wimp    jmp     0,      <-30

look
qscan   for     38
        cmp.x   (first+OFFSET+(qscan*BIGSTEP)), (first+(CORESIZE/2)+OFFSET+(qscan*BIGSTEP))
        mov.ab  #(-BOMBDIR*OVERLAP1)+(first+OFFSET+(qscan*BIGSTEP))-found, @found
        rof

found   jmz.b   first,  #0
mkfang  sub.ba  found,  qfang
        add.b   found,  qfang
        mov.i   qfang,  @qfang
        sub.f   subber, qfang
        djn.b   -2,     #(((BIGSTEP+(OVERLAP1+OVERLAP2))/SPACE)*2)+1
        jmp     first

qfang   jmp     pit+(qfang-found), #found-qfang
subber  dat     <BOMBDIR*(SPACE/2)+(CORESIZE/2), <-BOMBDIR*(SPACE/2)+(CORESIZE/2)

pit     mov.i   wimp-10,<wimp-10
        spl     -1,     <wimp-5
        spl     -1,     <wimp-5
        dat     0,      0
        dat     0,      0
        dat     0,      0
split   spl     #STEP,  <-STEP
vamp    mov.i   fang,   @fang
        add.f   split,  fang
        djn.f   vamp,   <-3000
fang    jmp     -7+STEP,#-3-STEP

        end     look
