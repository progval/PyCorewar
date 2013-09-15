;redcode-94 
;name  Rosebud
;author Beppe
;strategy a nice little thing
;strategy and a bunch of imps
;assert CORESIZE == 8000

step    equ     -845
djnoff  equ	split+step
impsize equ     2667
impdspl equ     away+impsize+impsize/3+impaway

impaway equ     1000	;more or less	:-)
away    equ     4000	;more or less	:-)

org     boot

boot    
	spl     impboot
	mov     cc,     @stptr1
for 5
	mov     {stptr, {stptr1
rof
	spl     *stptr1,<4000
stptr1  mul.f   #split+away,#split+away+2

x       dat     0,0
	dat     0,0
start   
clr     spl     #0,     0
split	spl	#-step,	<step
stone	mov	>-step,	step+1
	add	split,  stone
cnt     djn.f	stone,	<djnoff
stptr   dat     0,0
	dat     0,0
cc      dat     0,      #x
for MAXLENGTH-CURLINE-23
	spl     #stptr,impptr
rof
impboot
a for 8
	mov     <impptr,{impptr
rof
impptr  jmp     vector+impaway,vector
imp     mov.i   #impsize,*0
	mov     imp-impaway,imp+impdspl
	spl     1,<1000
	spl     1,<1100
	spl     1,<1200
	spl     1,<1300
	spl     2,1400
	jmp     imp+impdspl
	add.a   #impsize,-1
;-break
vector
	dat     0,0
for MAXLENGTH-CURLINE
	dat     0,0
rof
end

