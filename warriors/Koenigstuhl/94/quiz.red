;redcode-94 verbose
;name quiz
;author Schitzo
;strategy scanner, added stronger coreclear
;assert CORESIZE==8000
 
C       EQU     2376
FIRST   EQU     b+ADJ
TIMES   EQU     20
BOOT    EQU     5298
ADJ     EQU     85
 
org     boot
 
        dat.f   1,      1
        stp.f   0,      0               ;scanned
s       dat.f   FIRST,  FIRST+C
inc     dat.f   C*2,      C*2
 
        ;18 x "dat.f 0, 0"
 
cptr    dat.f   clr,    15
d       dat.f   <2667,  15
        dat.f   <-15,   15
clr     spl     #-3000,   15
        mov.i   @2,     >cptr
        mov.i   @1,     >cptr
        djn.b   -2,     {clr
 
        ;67 x "dat.f 0, 0"
 
a       add.f   inc-ADJ,        s-ADJ
        mov.i   b,      *s-ADJ
        jmz.f   a,      @s-ADJ
hit     mov.i   b,      @s-ADJ
        djn.b   a,      #TIMES
b       jmp     clr-67
 
        jmp.f   0,      0               ;scanned
 
boot    mov.i   a+5,    BOOT+5
        mov.i   a+4,    <boot
        mov.i   a+3,    <boot
        mov.i   a+2,    <boot
        mov.i   a+1,    <boot
        mov.i   a,      <boot
bootp   mov.i   s+1,    boot+BOOT-9-ADJ+1
        mov.i   s,      <bootp
boots   mov.i   cptr+6, boot+BOOT-7-67+6
        mov.i   cptr+5, <boots
        mov.i   cptr+4, <boots
        mov.i   cptr+3, <boots
        mov.i   cptr+2, <boots
        mov.i   cptr+1, <boots
        mov.i   cptr,   <boots
        spl     @boot                   ;scanned
        mov.i   b,      boot
        mov.i   b,      bootp
        mov.i   b,      boots
for     12
        dat.f   -boots, boots
rof
        cmp.i   0,      0
        
        dat.f   @1,     1
        dat.f   1,      @1
        dat.f   @1,     @1
        dat.f   1,      1
        dat.f   #1,     #1
        dat.f   #1,     @1
        dat.f   @1,     #1
        dat.f   #1,     1
        dat.f   1,      #1
        dat.f   <1,     <1
        dat.f   <1,     @1
        dat.f   <1,     #1
        dat.f   <1,     1
        dat.f   1,      <1
        dat.f   @1,     <1
 
        jmz.f   0,      0
 
        dat.f   @1,     1
        dat.f   1,      @1
        dat.f   @1,     @1
        dat.f   1,      1
        dat.f   #1,     #1
        dat.f   #1,     @1
        dat.f   @1,     #1
        dat.f   #1,     1
        dat.f   1,      #1
        dat.f   <1,     <1
        dat.f   <1,     @1
        dat.f   <1,     #1
        dat.f   <1,     1
        dat.f   1,      <1
        dat.f   @1,     <1
 
        sne.i   0,      0
 
        dat.f   @1,     1
        dat.f   1,      @1
        dat.f   @1,     @1
        dat.f   1,      1
        dat.f   #1,     #1
        dat.f   #1,     @1
        dat.f   @1,     #1
        dat.f   #1,     1
        dat.f   1,      #1
        dat.f   <1,     <1
        dat.f   <1,     @1
        dat.f   <1,     #1
        dat.f   <1,     1
        dat.f   1,      <1
        dat.f   @1,     <1
 
        ldp.ab  0,      0

