;redcode
;author Ansel G. Sermersheim
;name Basic Mulberry
;assert CORESIZE==8000

step 	equ 3 ;much better can be used, but 3 is easier to understand in
debug

	org	start

start	spl 	1    		;create 2 processes
	mov 	-1, 	0 	;add only 1 process, so now we have 3

repl	nop 	step, 	0
copy	mov 	>repl,	}repl   ; was 'mov <repl,{repl' (CCB)
	jmp	copy+step	;you can change this to spl
				;and put bombing back here, so long as there's at least
				;1 thread per location of your bomber + 3
