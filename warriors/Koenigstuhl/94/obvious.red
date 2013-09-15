;redcode-94b
;author John K. Lewis
;strategy "Smart" program.  Uses P-Space to remember last fight.
;name Obvious
;assert 1

result	ldp #0,#0	; load in last result
prog	ldp #1, #0	; load in last program (1-4)
	seq #1, -2	; stick with a winner
	add #1, prog	; if we lost try next program
	seq #0,prog
	mov.ba prog, 1	; grab program pointer
	jmp.a 1, 0	; eventual pointer
jmp.a rusty		; index of choices
jmp.a pidge
jmp.a impring
rusty stp #1,#1

sight   add #-25,#0
        jmz.a -1,@sight
        add #100,sight


        mov tib,>sight
        mov tob,>sight
        mov tic,>sight
        mov toc,>sight
        mov tac,>sight
        mov tuc,@sight
        add #-5,sight
        jmp @sight

tib     mov tac,<-2
tob     djn -1,#7990
tic     mov tac,<-3
toc     djn -1,#7990
tac     spl #0,-1
tuc     mov 1,<-1

dat 0,0
dat 0,0

pidge stp #2,#1

mov dwarf,1000
mov dwarf+1,1000
mov dwarf+2,1000
mov dwarf+3,1000
jmp 996
inc		equ #721

dwarf           add inc,ptr
                mov.i 3,@ptr
                djn dwarf, #2200
ptr             jmp #1,<100




impring stp #3,#1
spl 1
spl 1
spl 4
spl 2
jmp imp+2667*1
jmp imp+2667*2
jmp imp+2667*0
imp mov 0,2667

end

