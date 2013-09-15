;redcode-94
;name Twister
;author Beppe Bezzi
;strategy qscan -> Tornado bomber
;assert CORESIZE == 8000

step    equ     -45               
away    equ     (4000+2)                 ;mod 5 +2
gate1   equ     (gate-4)

org     startq 


qstep   equ     6
qrounds equ     8
qdisp   equ     -qstep*(qrounds*3/2-1)-60
qqstep  equ     qstep*qrounds
bigst   equ     100                     ;or something more :-)
qstart  equ     startq+145
qst     equ     qstart -(4*bigst)

pstep   equ     40
spacer  equ     4
cldst   equ     (bclr-bgate+spacer+5)


pit     spl     4
pit1    mov     -3,     <1300
	spl     pit1
	spl     pit1
	stp.b   #0,     @pit1
	jmp     pit1

;----Qscan

;don't ever think it's the right qscan pattern :-)

startq
s3 for 4
	sne.i   qst+4*bigst*(s3+0), qst+4*bigst*(s3+0)+bigst*1
	seq.i   qst+4*bigst*(s3+0)+bigst*2, qst+4*bigst*(s3+0)+bigst*3
	mov.ab  #qst+4*bigst*(s3+0)-found, found
     rof
	jmn.b   which,  found
s2 for 4
	sne.i   qst+4*bigst*(s2+5), qst+4*bigst*(s2+5)+bigst*1
	seq.i   qst+4*bigst*(s2+5)+bigst*2, qst+4*bigst*(s2+5)+bigst*3
	mov.ab  #qst+4*bigst*(s2+5)-found, found
     rof
	jmn.b   which,  found
s1 for 4
	sne.i   qst+4*bigst*(s1+10), qst+4*bigst*(s1+10)+bigst*1
	seq.i   qst+4*bigst*(s1+10)+bigst*2, qst+4*bigst*(s1+10)+bigst*3  
	mov.ab  #qst+4*bigst*(s1+10)-found, found
     rof
	jmn  which,   found

which
found   jmz.b   boot,   #0      ;Pyramid decoding
	add.b   found,  pt2
	sne.i   @found, @pt2  
	add.ab  #(bigst*2),found
	sne.i   -100,   @found
	add.ab  #bigst, found
qattack                           ;found.b punta il bersaglio       
	mov     bombm,	@found    ;dat bomb found position

	add.ba  found,  qstone    ;\.
	add.b   found,  qstone    ; >setup vamp pointers
	sub.ba  found,  bombf     ;/.

;---vamp attack ---

qb1      mov     bombn,  *qstone
qb2      mov     bombf,  @qstone
qstone   mov     (1*qqstep)+bombn+qdisp,@(3*qqstep)+bombn+qdisp
qstart1  sub     qincr,   @qb1
	add.a   qincr,   bombf       
qjump   djn.b   qb1,    #qrounds
	jmp     boot

bombn   jmp     *qqstep,  qqstep
qincr   dat     >-1*qstep,>-1*qstep      

bombf   jmp     -bombn+pit-(3*qqstep)-qdisp,-qqstep

for 5
	dat     0,0
rof

;--- Tornado

start
boot

	mov     gate,   }pt2
	mov     gate,   *pt2
	mov     last,   <pt1
	spl     1,      1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1
	mov     {pt1,   <pt1

go      djn.b   @pt1,   #2      ;start Tornado
	mov     gate,   <pt1
pt1     div.f   #last,#last+1+away
pt2     div.f   #gate+away-5,#bigst+found
	
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

shift   dat     #40,    #40     


