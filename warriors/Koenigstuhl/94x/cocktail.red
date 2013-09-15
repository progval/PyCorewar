;redcode-94
;name Cocktail
;author Maurizio Vittuari
;contact pan0178@iperbole.bologna.it
;NSFCWT Round 8 
;strategy Switching between Taking Names and a paper
;strategy according to Father and Son strategy
;strategy No time to do better :(
;assert CORESIZE==55440
; 1=win, 2=tie, 0=loss
; Son   : 1 -> stay, else goto father
; Father: 0 -> goto son, else stay
; Son = paper		 Father = TT


son_str	equ	#413	; son id
fat_str	equ	#0	; father id
s_slot	equ 	#210	; strategy slot


; * * * Thinking routines * * *

res	ldp	#0,	0
strat	ldp	s_slot,	0
	sne	son_str,strat	
	djn	father, res	
	jmn	father,	res	

;	* * * Son * * *

step1	equ	3743
step2	equ 	1567
step3	equ	1349

son	stp	son_str,s_slot
r_count	spl	1,	<last+1
	mov	-1,	0
	mov	-1,	0
r_boot	spl	1,	<b_dist
s1	spl	step1,	#0
	mov	>-1,	}-1
	mov	bomb,	>1942
s2	spl	step2,	#0
	mov	>-1,	}-1
	mov	bomb,	}1842
	mov	bomb,	>2000
	mov	<s2,	<s3
s3	jmp 	@0,	}step3
bomb	dat	<1,	{1


;	 * * * Father * * *

b_dist	equ	6000

father	stp	fat_str,s_slot
for 22
	mov	<r_count,<r_boot	; boot
rof
	jmp	b_dist+r_boot-(last-comp+1),	{b_dist/2

step    equ    98
soap	equ	2

bw	stp	#soap,	#20	; spl spl spl stp jmp  bomb!
clrptr  dat	last+2

jmp4	jmp	-4,	<-1
reset   dat	#step-4,#step
spl2	spl	-2,	<1
spl1	spl	-1,	<2

attack	mov	jmp4,	*comp
compptr	mov	bw,	{comp
	mov	spl2,	{comp
	mov	spl1,	{comp
	mov	spl0,	{comp
	sub	reset,	@compptr

scan	add	spl0,	@compptr
comp	sne	2*step,	3*step
	add	spl0,	@compptr
	seq	*comp,	@comp
	slt	#100+step,@compptr
ctr	djn	scan,	#2500*8
	jmn	attack,	-1

spl0	spl.i	#(2*step),#(2*step)
clear	mov	reset,	>clrptr
last	jmp	-1
end res
