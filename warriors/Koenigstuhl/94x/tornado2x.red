;redcode-94x 
;name Tornado 2.0 x
;author Beppe Bezzi
;strategy Fast 60% c bomber -big core version
;strategy v 2.0 stronger, new clear
;assert CORESIZE == 55440

org     tornado  

step    equ     185             

away    equ     34456
djnoff  equ     -12000


tornado
	mov     last,  away
for 12
	mov     {tornado, <tornado
rof        
	jmp     @tornado, <tornado

warr
gate    
	nop     split,  100 ;(clear start)
   
incr    spl     #3*step,#3*step      
start1  add     incr    ,stone           
stone   mov     *step+jump-5, *(2*step)+jump-5
	mov     bombm,   @stone
	mov     bombs,   *stone
jump    djn.f   start1, <djnoff
;jump    djn.b   start1,  #count         ;hit
;break
clr     mov     *gate,  >gate
djmp    djn.f   clr,    {gate-20
wip     dat     #wip-gate,  <20
split   spl     #wip-gate,  #wip-gate+5
;break
bombm   mov     step,   1
last
;break
bombs   spl     #step,   #1
a for (MAXLENGTH-CURLINE)/5
	spl     #0,     tornado
	spl     #a,     tornado
	spl     #1,     #1
	spl	#1,	1
	spl	#tornado,gate
rof


