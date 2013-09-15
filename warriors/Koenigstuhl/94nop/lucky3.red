;redcode-94
;assert CORESIZE==8000 && MAXPROCESSES==8000 && MAXCYCLES==80000
;assert MAXLENGTH==100 && MINDISTANCE==100
;name Lucky 3
;author Stefan Strack
;strategy imps(6), stone(-98,108,>clear), wimp
;strategy Submitted: @date@

AWAY    equ     2503

start   mov     stone+3, stone+3+AWAY
        mov     stone+2, <start
        mov     stone+1, <start
        mov     stone, <start
; 6-process 3-point spiral (coresize 8000, '94 standard)
step    equ     2667
launch
        spl     lbl3
        spl     lbl5
        spl     lbl9
        jmp     imp+0*step+0
lbl9    jmp     imp+1*step+0
lbl5    spl     lbl11
        jmp     imp+2*step+0
lbl11   jmp     imp+0*step+1
lbl3    jmp     1               ; Idle 1 cycle
        spl     lbl13
        jmp     imp+1*step+1
lbl13   spl     imp+2*step+1
;macro
for 6
        spl     stone+AWAY
rof
        mov.i   wimp,2600
        jmp     >-1
wimp    jmp     #1965,<-3
for 7
num for 7
        dat num,num
rof
rof
stone   spl.b   #98,>-108 ;52
        mov.i   >2-98,stone+108
        sub.f   stone,-1
        djn.f   -2,<-100
for 8
        dat 1,1
rof
for 12
        dat 0,0
rof
imp     mov.i   #1994,  step
