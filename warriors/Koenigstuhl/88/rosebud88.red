;redcode
;name  Rosebud 88
;author Beppe
;strategy a nice little thing
;strategy and a bunch of imps
;strategy 88 version 
;strategy v.2 gate crashing imps
;assert CORESIZE == 8000

step    equ     -845
djnoff  equ     split+step
impsize equ     2667
impdspl equ     away+impsize+impsize/3+impaway
impproc equ     16
impaway equ     -1000
away    equ     3679
btaway  equ     0

impsize2 equ 2667
impsize1 equ 2668
offset1  equ 1833-impsize2
offset2  equ offset1+15
offset3  equ offset1+15+2
decst    equ 400-(start*57)
stinc    equ 190

start    mov imp1,imp1+offset2+5
         mov imp1,<start
         mov imp1,<start
         mov imp1,<start
         mov imp1,<start
         mov imp1,<start
         mov imp2,imp1+offset1+impsize2

boot    
	mov     cc,     @stptr2
for 5
	mov     <stptr, <stptr1
rof
	spl     @stptr1,<4000
	mov     <stptr, <stptr1


         spl lnch1,<decst
         spl lnch3,<decst

lnch2    spl lnch2b,<decst
lnch2a   spl lnch2ab,<decst
lnch2aa  spl 2,<decst
         jmp imp1+offset2+(impsize1*0),<decst
         jmp imp1+offset2+(impsize1*1),<decst
lnch2ab  spl 2,<decst
         jmp imp1+offset2+(impsize1*2),<decst
         jmp imp1+offset2+(impsize1*3),<decst
lnch2b   spl lnch2bb,<decst
lnch2ba  spl 2,<decst
         jmp imp1+offset2+(impsize1*4),<decst
         jmp imp1+offset2+(impsize1*5),<decst
lnch2bb  spl 2,<decst
         jmp imp1+offset2+(impsize1*6),<decst
         jmp imp1+offset2+(impsize1*7),<decst
         
lnch3    spl lnch3b,<decst
lnch3a   spl lnch3ab,<decst
lnch3aa  spl 2,<decst
         jmp imp1+offset3+(impsize1*0),<decst
         jmp imp1+offset3+(impsize1*1),<decst
lnch3ab  spl 2,<decst
         jmp imp1+offset3+(impsize1*2),<decst
         jmp imp1+offset3+(impsize1*3),<decst
lnch3b   spl lnch3bb,<decst
lnch3ba  spl 2,<decst
         jmp imp1+offset3+(impsize1*4),<decst
         jmp imp1+offset3+(impsize1*5),<decst
lnch3bb  spl 2,<decst
         jmp imp1+offset3+(impsize1*6),<decst
         jmp imp1+offset3+(impsize1*7),<decst
         
lnch1    spl lnch1b,<decst
lnch1a   spl lnch1ab,<decst
lnch1aa  spl 2,<decst
         jmp imp1+offset1+(impsize2*1),<decst
         jmp imp1+offset1+(impsize2*2),<decst
lnch1ab  spl 2,<decst
         jmp imp1+offset1+(impsize2*3),<decst
         jmp imp1+offset1+(impsize2*4),<decst
lnch1b   spl lnch1bb,<decst
lnch1ba  spl 2,<decst
         jmp imp1+offset1+(impsize2*5),<decst
         jmp imp1+offset1+(impsize2*6),<decst
lnch1bb  spl 2,<decst
         jmp imp1+offset1+(impsize2*7),<decst
         jmp imp1+offset1+(impsize2*8),<decst
         
imp2     mov 0,impsize2
imp1     mov 0,impsize1



incr	dat     <-step,<step       
clr     spl     0,     0
split   spl     0,      <step
stone   mov     <-step, step+3  ;2
	add     incr,  stone
cnt     djn     stone,  <djnoff
stptr   dat     #0,     #0
	dat     #0,     #0
cc      dat     #0,      #x

stptr1  dat     #0,     #split+away
stptr2
x       dat     #0,     #split+away+2
	dat     #0

end     start
