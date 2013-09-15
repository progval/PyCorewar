;redcode-b
;name Hi Ho Silver 1
;author Steve Bailey
;strategy Scanner (Spl/Jmp bomp) + coreclear
;strategy 71.4 Wilkies
;assert CORESIZE==8000

loops   equ     1485

ptr     dat     $0,     $0      ;0

for 8-0-1
        dat     $0,     $0
rof

bomb    mov.i   jbomb,  *ptr    ;8
        mov.i   sbomb,  {ptr
        mov.i   jbomb,  @ptr
        mov.i   sbomb,  <ptr
        nop     }ptr,   >ptr
cntr    jmp     cont,   #loops  ;13 (14)

for 52-13-1
        dat     $0,     $0
rof

seek    add.f   step,   ptr     ;52
        sne.i   *ptr,   @ptr
cont    djn.b   seek,   cntr
clrptr  jmn     bomb,   cntr
        jmp     step            ;56

for 94-56-1
        dat     $0,     $0
rof

sbomb   equ     (step)
step    spl     #-877,  #877    ;94
        mov.i   dbomb,  <clrptr
dbomb   dat     <-2667, <2667
jbomb   jmp     -1,     <-2     ;97 (100)

        end     seek
