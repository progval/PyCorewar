;redcode-94x
;name  Rosebud
;author Beppe
;strategy a nice little thing
;strategy and a bunch of imps
;assert CORESIZE == 55440

step    equ     -985
djnoff  equ     split+step
impsize equ     34117
impdspl equ     away+impsize+impsize/13
impproc equ     16
impaway equ     -1000
away    equ     3679
btaway  equ     0
org     boot

boot    
	mov     cc,     @stptr1
for 5
	mov     {stptr, {stptr1
rof
	spl     *stptr1,<4000
stptr1  div.f   #split+away,#split+away+2
	spl     impboot

x       dat     0,0
	dat     0,0
start   
clr     spl     #0,     0
split   spl     #-step, <step
stone   mov     >-step, step+1
	add     split,  stone
cnt     djn.f   stone,  <djnoff
stptr   dat     0,0
	dat     0,0
cc      dat     0,      #x
for MAXLENGTH-CURLINE-23
	spl     #stptr,vector
rof


imp     mov.i   #impsize,*0
impboot
	mov     imp,imp+impdspl
	spl     1,<1000
	spl     1,<1100
	spl     1,<1200
	spl     1,<1300
	spl     1,<3000
	spl     1,<5000
	spl     2,<1400
	jmp     imp+impdspl
	add.a   #impsize,-1
;-break
vector
	dat     0,0
for MAXLENGTH-CURLINE
	dat     0,0
rof
end

