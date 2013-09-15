;redcode-94
;name Jack in the box II
;author Beppe Bezzi
;strategy Same old strategy, improved components
;strategy p-switching Tornado and silk
;assert CORESIZE == 8000

        org     think		;v 2.03

PIN     371                     ;3371

_RES    equ     #0
_STR    equ     #(1+417)        ;more or less 500 :-)

step    equ     -45               
DIST
away    equ     (3900+17)       ;more or less 3900 :-)
gate1   equ     (gate-4)

A0      equ     3488
A1      equ     1860
A2      equ     3740
   
marcia
	
	spl     1,      <300    ;\.
	spl	1,	<400	;-\ generate 15
	spl     1,      <500    ;-/ parallel processes
	mov	-1,	0	;/.

	mov	<bootslk,{bootslk
bootslk	spl	4000-17,	silk+15       ;more or less 4000

silk    spl     @0,     }A0     ;split 
	mov.i   }-1,    >-1     ;copy 
	mov.i   bomb1,  >123    ;bombing
silk2   spl     @0,     }A1     ;split
	mov.i   }-1,    >-1     ;copy
	mov.i   bomb1,  >1001   ;bombing
	mov.i   bomb ,  }2042   ;A-indirect bombing
	mov.i   {silk2, <silk3  ;copy
silk3   jmp     @0,     >A2     ;jmp new copy 
bomb    dat.f   >2667,  >5334   ;anti-imp bomb
bomb1   dat     >1,     }1      ;anti clear bomb

for 12
	dat     0,0
rof

think
res     ldp.ab  _RES,   #0
str     ldp.a   _STR,   str1    ;load strategy in use
	sne.ab  #0,     res     ;check result
lost    add.a   #1,     str1    ;lost change 
	mod.a   #2,     str1    ;secure result
win     stp.ab  str1,   _STR
str1    jmp     @0,     tornado
	dat     0,      marcia


for 12
	dat     0,0
rof

tornado 
	mov     gate,   }pt2
	mov     gate,   *pt2
	mov     last,   <pt1
	spl     1,      1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1

go      djn.b	@pt1,   #2      ;start Tornado
	mov     gate,   <pt1


pt1     div.f   #last,	#last+1+away
pt2     div.f   #gate+away-5,#1


;--- Tornado 3.8
for MAXLENGTH-CURLINE-14
	dat     0,0
rof

start
	
	dat     -25,    last-gate1+5
warr
gate    
	dat     -25,    last-gate1+15
bombs   spl     #(step+1),  -step           ;hit spl
start1  sub     incr,   @b1           
stone   mov     (0*step)+jump+1,*(1*step)+jump
b2      mov     bombs,  @stone
b1      mov     bombm,  *stone
jump    jmz.b   start1, #0         ;hit by spl
clr     mov     @djmp,  >gate1
	mov     @djmp,  >gate1
djmp    djn.b   clr,    {bombs
incr    dat     >-3*step,>-3*step      
last
bombm   dat     <1,     {1

	end
