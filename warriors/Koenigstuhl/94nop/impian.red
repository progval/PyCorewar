;redcode-94
;name The Impian
;author bjoern guenzel
;strategy continuous spiral launch
;assert CORESIZE==8000
;release 19.5.96

istep 	equ 2667

start		spl 1			;this is only for demonstration

		spl #0,<-200		;put two processes here
		spl 4,<-1
		spl 2,#j1
j1		jmp imp,}0
j2		jmp imp+istep,}0
		nop #j2,#j3		;use for extra attack...
j3		jmp imp+2*istep,}0
imp		mov.i #istep,*0

		end start
