;redcode-94
;name blister soul
;author schitzo
;strategy 80% bomber/scanner -> multi-pass coreclear
;strategy sorta trying an improvement on quiz...
;strategy fixed a small coreclear bug
;assert 1

STEP    EQU     168       ; mod-8
A       EQU     tr+STEP
B       EQU     A+STEP
C1      EQU     (63+3)    ; space between scan engine and coreclear
C2      EQU     (24)      ; space between scan engine and inc, half, j
BOOT    EQU     -3207     ; random boot distance

org boot

boot    mov.i   inc+2,  @b
        mov.i   a+5,    {b
        mov.i   a+4,    {b
        mov.i   a+3,    {b
        mov.i   a+2,    {b
        mov.i   a+1,    {b
        mov.i   a,      {b
b       spl     boot+BOOT+6,    boot+BOOT+C2+8
        mov.i   cptr+6, *b2
        mov.i   cptr+5, {b2
        mov.i   cptr+4, {b2
        mov.i   cptr+3, {b2
        mov.i   cptr+2, {b2
        mov.i   cptr+1, {b2
        mov.i   cptr,   {b2
b2      mov.i   @boot+BOOT-C1-2+7,      #0
        mov.i   inc+1,  <b
        mov.i   inc,    <b
        mov.i   boot-1, b

cptr    dat.f   <-15,   <15             ;may get bombed with j
        dat.f   <-15,   <15
        dat.f   <-15,   >2667
cclear  spl     #-300,  >2667
        mov.i   @2,     >cptr
        mov.i   @1,     >cptr
        djn.b   -2,     {cclear

        dat.f   #1,     1       ;68 spaces in booted warrior
        dat.f   1,      1
        dat.f   @1,     @1

a       add.f   inc+C2, @2
        mov.i   j+C2,   *ptr
        mov.i   j+C2,   @ptr
ptr     seq.i   @A,     @B
        sub.f   half+C2,        @-2
tr      jmp     a

                ;20 spaces in booted warrior

inc     dat.f   STEP*4, STEP*4
half    dat.f   STEP*2, STEP*2
j       jmp     cclear-tr-C1+9, STEP*2

; big decoy removed.  it's just a bunch of "dat 1, 1"s, all with different
; modifier combinations, except with every 8th instruction the same... or
; something like that...

