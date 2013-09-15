;redcode-b verbose
;name Syzygy 1.0
;author Philip Kendall
;strategy Scan / spl carpet -> spl/dat coreclear
;strategy Based on Core Warrior 2
;assert CORESIZE==8000

SCAN1   equ     104
SEP     equ     5
STEP    equ     15
BOMBLEN equ     10
STREAM  equ     -305
CSTART  equ     last+5                  ; where to start the coreclear
GAPLEN  equ     70

loop    add.f   sbomb,scan              ; a one-pass scan
scan    sne.i   SCAN1,SCAN1+SEP
        djn.f   loop,<(STREAM-loop)
        mov.ab  #BOMBLEN,count
bloop   mov.i   sbomb,}scan
count   djn.b   bloop,#0
        sub.a   #BOMBLEN,scan
        cmp.a   loop,sbomb              ; loop will be bombed
        djn.f   loop,<(STREAM-loop)
        jmp.a   csplit,<(STREAM-loop)+1
sbomb   spl.a   #STEP,#STEP
space   for     GAPLEN          ; \.
        dat.f   0,0             ;  > space to help against scanners
        rof                     ; /.
ptr     dat.f   cbomb1,CSTART
cbomb0  dat.f   #cbomb0-ptr,CSTART-ptr
cbomb1  spl.a   #cbomb0-ptr,CSTART-ptr
csplit  spl.a   #0,<(STREAM-loop)+1
clear   mov.i   *ptr,>ptr               ; repeated spl/dat coreclear
        mov.i   *ptr,>ptr
        mov.i   *ptr,>ptr
last    djn.f   clear,<(STREAM-loop)
        end     scan

