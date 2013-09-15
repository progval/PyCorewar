;redcode-94x
;assert CORESIZE==55440 && MAXPROCESSES==10000 && MAXCYCLES==500000
;assert MAXLENGTH==200 && MINDISTANCE==200
;name Lucky 13
;author Stefan Strack
;strategy imps(26), stone(-4766,188,>clear)

AWAY    equ     17013

start   mov     stone+3, stone+3+AWAY
        mov     stone+2, <start
        mov     stone+1, <start
        mov     stone, <start
; 26-process 13-point spiral (coresize 55440, '94 standard)
step    equ     34117
launch
        spl     lbl3
        spl     lbl5
        spl     lbl9
        spl     lbl17
        spl     lbl33
        jmp     imp+0*step+0
lbl33   jmp     imp+1*step+0
lbl17   spl     lbl35
        jmp     imp+2*step+0
lbl35   jmp     imp+3*step+0
lbl9    spl     lbl19
        spl     lbl37
        jmp     imp+4*step+0
lbl37   jmp     imp+5*step+0
lbl19   spl     lbl39
        jmp     imp+6*step+0
lbl39   jmp     imp+7*step+0
lbl5    spl     lbl11
        spl     lbl21
        spl     lbl41
        jmp     imp+8*step+0
lbl41   jmp     imp+9*step+0
lbl21   spl     lbl43
        jmp     imp+10*step+0
lbl43   jmp     imp+11*step+0
lbl11   spl     lbl23
        spl     lbl45
        jmp     imp+12*step+0
lbl45   jmp     imp+0*step+1
lbl23   spl     lbl47
        jmp     imp+1*step+1
lbl47   jmp     imp+2*step+1
lbl3    spl     lbl7
        spl     lbl13
        spl     lbl25
        spl     lbl49
        jmp     imp+3*step+1
lbl49   jmp     imp+4*step+1
lbl25   spl     lbl51
        jmp     imp+5*step+1
lbl51   jmp     imp+6*step+1
lbl13   spl     lbl27
        spl     lbl53
        jmp     imp+7*step+1
lbl53   jmp     imp+8*step+1
lbl27   spl     lbl55
        jmp     imp+9*step+1
lbl55   jmp     imp+10*step+1
lbl7    djn.b   0,      #2      ; Idle 2 cycles
        spl     lbl57
        jmp     imp+11*step+1
lbl57   spl     imp+12*step+1
;macro
for 6
        spl     stone+AWAY
rof
        jmp     stone+AWAY
for 16
num for 7
        dat num,num
rof
rof
stone   spl.b   #4766,>-188 ;52
        mov.i   >2-4766,stone+188
        sub.f   stone,-1
        djn.f   -2,<-100
for 8
        dat 1,1
rof
for 12
        dat 0,0
rof
imp     mov.i   #1994,  step

