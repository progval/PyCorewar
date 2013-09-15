;redcode-b verbose
;name qbomber v .469
;author Ryan Coleman
;strategy Qbomber --> tornado
;assert 1
;planar quick, bomb

ORG split2

QB EQU (start+400)
QS EQU 200
QD EQU 100

split2   spl mid1
         spl mid2
         spl tail
start    mov  >QB+QS*0,>QB+QS*0+QD
         mov  >QB+QS*1,>QB+QS*1+QD
         mov  >QB+QS*2,>QB+QS*2+QD
         mov  >QB+QS*3,>QB+QS*3+QD
         mov  >QB+QS*13,<QB+QS*13+QD
         mov  >QB+QS*4,<QB+QS*4+QD
         mov  >QB+QS*5,<QB+QS*5+QD
         mov  <QB+QS*6,>QB+QS*6+QD
mid1     mov  >QB+QS*7,<QB+QS*7+QD
         mov  >QB+QS*15,<QB+QS*15+QD
         mov  >QB+QS*16,<QB+QS*16+QD
         mov  <QB+QS*20,<QB+QS*20+QD
         mov  <QB+QS*21,>QB+QS*21+QD
         mov  <QB+QS*22,<QB+QS*22+QD
         mov  >QB+QS*10,>QB+QS*10+QD
         mov  <QB+QS*11,<QB+QS*11+QD
mid2     mov  >QB+QS*12,<QB+QS*12+QD
         mov  <QB+QS*23,<QB+QS*23+QD
         mov  <QB+QS*24,<QB+QS*24+QD
         mov  >QB+QS*17,<QB+QS*17+QD
         mov  <QB+QS*8,<QB+QS*8+QD
         mov  <QB+QS*9,>QB+QS*9+QD
         mov  <QB+QS*27,<QB+QS*27+QD
         mov  <QB+QS*28,<QB+QS*28+QD
         mov  <QB+QS*30,<QB+QS*30+QD
tail     mov  <QB+QS*33,>QB+QS*33+QD
         mov  <QB+QS*32,<QB+QS*32+QD
         mov  <QB+QS*31,<QB+QS*31+QD
         mov  >QB+QS*34,<QB+QS*34+QD
         mov  <QB+QS*33,<QB+QS*33+QD
         mov  <QB+QS*35,>QB+QS*35+QD
         mov  datz, -1

;stuff here
; TORNADO BOMBER

step    equ     -45
away    equ     3333 ; not really
gate1   equ     (gate-4)

boot
   mov     gate,   }pt2
   mov     gate,   *pt2
pt1 mov    last,   <pt2
   spl     1,      1
   mov     {pt1,   <pt2
   mov     {pt1,   <pt2
   mov     {pt1,   <pt2
   mov     {pt1,   <pt2
   mov     {pt1,   <pt2

go      djn.b   @pt2,   #2      ;start Tornado
   mov     gate,   <pt2
pt2     div.f   #gate+away-5,#last+1+away
   dat     -25,    last-gate1+5
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

bombm   dat     <1,     {1
      dat 0,0
datz: dat 0,0
FOR 5
      dat 0,0
ROF

        end
