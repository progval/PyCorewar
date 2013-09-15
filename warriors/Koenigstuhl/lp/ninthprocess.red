;redcode-lp quiet
;name ~~ The 9th Process v8 ~~
;author Zul Nadzri
;assert (CORESIZE == 8000) && (MAXPROCESSES==8)
;strategy version 8

incr equ 2891 ;3039

top    add #incr, #switch+incr
check  jmz.f -1, @-1
       slt.b -2, #10
       mov *switch, @top
       jmz.a top, top-2
	 jmp life, }0
       dat 0,0
	 dat 0,0
life	 jmp #0, <-2
jump   jmp #1, {1
switch dat #jump, <0

end check

