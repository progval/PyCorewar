;redcode-nano
;name Booing1674
;author Neo
;assert CORESIZE==80
;strategy Self-expandable clear

        t1 equ -13 ;-50
        t2 equ -6  ;-54
        t3 equ 20  ;-55
        t4 equ -28 ;-35
        t5 equ -37 ;-56

start:	spl #3,<5
	mov }-1,>-1
	;mov }-2,>-2
	mov {t1,{t2
	mov {-1,{t3
	mov {t4,<t5

	end start
