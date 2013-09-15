;redcode-94
;name seventyfive
;author Anders Ivner
;assert (CORESIZE == 8000)
;strategy 75% bomber -> separate multipass coreclear
;strategy Credits to Karl Lewin for crow.

STEP    EQU     14
        ORG     bomber
STEPB   EQU     85
COUNT   EQU     500
A       equ     (jump+STEPB*2)

head    dat     #0,     #tail+100
d1      dat     <0,     <tail-head+5
s2      spl     #3450,  #tail-head+5
s1      spl     #3450,  #tail-head+5
incr    spl.a   #-STEP, <-STEP
go      mov.i   @tail,  >head
        mov.i   @tail,  >head
tail    djn.b   go,     {s1
for 74
        dat     0,0
rof
bd      dat     #2*STEPB,#2*STEPB
incrb   spl     #3*STEPB,#3*STEPB
        dat     0,      0
bomber  mov     bd,     @pt
pt      cmp     A,      @A-STEPB
        sub     bd,     pt
        add     incrb,  pt
jump    djn.b   bomber, #COUNT
        jmp     incr

        end
