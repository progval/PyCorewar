;redcode-94
;name Tornado 4
;author Beppe Bezzi
;strategy 60%c bomber
;assert CORESIZE == 8000

step    equ     -45               
count   equ     530
away    equ     4110
gate1   equ     (gate-4)

org     start

;--- Tornado

start
boot
;-break        
        mov     gate,   }pt2
        mov     gate,   *pt2
        mov     last,   <pt1
        mov     {pt1,   <pt1
        mov     {pt1,   <pt1
        mov     {pt1,   <pt1
        mov     {pt1,   <pt1
        mov     {pt1,   <pt1
        mov     {pt1,   <pt1
        mov     {pt1,   <pt1
        mov     {pt1,   <pt1
        mov     {pt1,   <pt1
        mov     {pt1,   <pt1

go      spl     @pt1,   <pt1    ;start Tornado
        mov     gate,   @pt1
        dat     -25,    last-gate1+5
pt1     dat     #last,#last+1+away
pt2     dat     #gate+away-5,1
        
warr
gate    
        dat     -25,    last-gate1+15
bombs   spl     #(step+1),  -step           ;hit spl
start1  sub     incr,   @b1           
stone   mov     (0*step)+jump,*(1*step)+jump
b2      mov     bombs,  @stone
b1      mov     bombm,  *stone
jump    jmz.b   start1, #0         ;hit by spl
clr     mov     @djmp,  >gate1
        mov     @djmp,  >gate1
djmp    djn.b   clr,    {bombs
incr    dat     >-3*step,>-3*step      
last
;-break
bombm   mov.i   #1,     {1

shift   dat     #40,    #40     

for MAXLENGTH-CURLINE
        spl     1,1
rof

