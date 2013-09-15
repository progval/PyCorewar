;redcode-94
;name crow
;author Karl Lewin
;assert CORESIZE==8000

STEP    EQU     14
        ORG     bomber
STEPB   EQU     85
COUNT   EQU     500

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
bd      dat     #STEPB, #1
incrb   spl     #3*STEPB,#3*STEPB
        dat     0,      0
bomber  mov.i   bd,     *stone
        mov.i   bd,     @stone
stone   mov.i   *STEPB+2,*(2*STEPB)+2
        add     incrb,  stone
jump    djn.b   bomber, #COUNT
        jmp     incr
