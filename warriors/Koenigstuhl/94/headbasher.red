;redcode
;name Head Basher
;author Brian Haskin
;strat kill electric head
;strat use a dodger to boot a
;strat brainwashing core clear
;strat not very elegant but really effective.
;assert CORESIZE==8000

	org start

guard   dat 0,lst+5
for 6
	dat 1,1
rof

start   sne <ptr, @guard        ;scan core
	jmz.f -1,<ptr
	jmz.f 2,lst+5           ;check for decrement
	mov #lst+75,ptr
	seq.ab #45,<ptr         ;check if we found EH's clear.
	add #-60,ptr            ;add in case we hit the end of EH's main
body
ptr     mov lst,guard           ;copy clear
for 9
	mov {ptr,<ptr
rof
	add #3,ptr
	jmp @ptr

bmb     stp #0,#250
pt      dat 0,-1
	spl #0
cc      mov bmb,<pt
	mov bmb,<pt
	mov bmb,<pt
	djn cc,#(8000-9)/3
	mov pt,bmb
	mov #-2,pt
lst     jmp cc-1

for 4
	dat 1,1
rof
	dat 0,0

for MAXLENGTH-CURLINE
	dat 1,1
rof
	end
