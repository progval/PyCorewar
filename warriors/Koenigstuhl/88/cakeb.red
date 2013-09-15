;redcode
;name		CAKE B
;author		S. Halvorsen
;address	snh@flipper.pvv.unit.no
;strategy	Cripple And Kill (the) Enemy.
;strategy
;strategy	This program drops a lot of JMP 0 bombs, and when
;strategy	the enemy execute it, he gets stuck.
;strategy	After he is stuck, I have all the time i need to
;strategy	kill him off.
;strategy
;strategy	Version B is better against scanners.
;strategy	(Only a few B-fields are non-zero.)

;assert 1

;****************************************
;
; Dersom motstanderen har rukket aa splitte opp
; en god del, kan han ta knekken paa meg lenge
; foer jeg rekker aa ta knekken paa ham.
;
; Versjon B setter ut killers FOER den bomber minnet
; det betyr at scanners har mindre sjangse til aa
; finne programmet ( Killers har kun #0 i B-felt !)
; Etter aa ha satt ut JMP 0's saa hopper jeg blindt
; til de killerne jeg har satt ut.
;
;****************************************

; Versjon C skal gaa over fra aa bombe med JMP 0 til JMP trap
; Dette vil antagelig gi bedre uttelling mot splitters.

step		equ 35		; (Treffer hver 5. lokasjon.)
init		equ (step+2+0) 	; Dette gir spredt og tett bombing.
repeat		equ 910		; Gaar rundt helt til hver 5. er bombet.
bs		equ 1600	; bigstep = Avstand mellom killer dwarfs.
;stepnrs	equ 5		; Antall killer dwarfs.

kill1		equ (dropbomb - s1 + ( bs * 1 ) - 32)	; Places selected so
kill2		equ (dropbomb - s2 + ( bs * 2 ) - 22)	; that kill1 is the
kill3		equ (dropbomb - s3 + ( bs * 3 ) - 12)	; last one to die.
kill4		equ (dropbomb - s4 + ( bs * 4 ) - 2)	;(Just before kill5.)


cleanit 	dat #0			; Deletes code that copies the
CleanCnt 	dat #endinit		; kill-routine out to five
cleanup 	mov cleanit, <CleanCnt	; different places in memory
		jmp cleanup

start 		mov kill, dropbomb + kill1
		mov killjmp, dropbomb + kill1 + 1

		mov kill, dropbomb + kill2
		mov killjmp, dropbomb + kill2 + 1

		mov kill, dropbomb + kill3
		mov killjmp, dropbomb + kill3 + 1

		mov kill, dropbomb + kill4
		mov killjmp, dropbomb + kill4 + 1

		spl cleanup
		jmp stophim
endinit 	dat #0


		dat #0		; bombed with JMP 0

kbomb 		dat #0
kcount 	dat #0
kill 		mov kbomb, <kill	; Invisible to scanners until it
killjmp 	jmp kill		; starts dropping bombs
					; (Impossible to trace back since)
					; (kcount contains the offset to)
					; (where kbomb is to be placed. )
endkill 	dat #0		; bombed with JMP 0


		dat #0
		dat #0
		dat #0
		dat #0
		dat #0		; bombed with JMP 0
		dat #0
		dat #0
		dat #0
		dat #0
		dat #0		; bombed with JMP 0
		dat #0
		dat #0
		dat #0
		dat #0
		dat #0		; bombed with JMP 0
		dat #0
		dat #0
		dat #0
		dat #0
		dat #0		; bombed with JMP 0
		dat #0
		dat #0
		dat #0
		dat #0
		dat #0		; bombed with JMP 0
		dat #0
		dat #0
		dat #0
		dat #0
		dat #0		; bombed with JMP 0
		dat #0
		dat #0
		dat #0
		dat #0
		dat #0		; bombed with JMP 0
		dat #0
		dat #0
		dat #0
		dat #0



jbomb 		jmp jbomb, #5		; This spot will be bombed
					; (Give false clue to fool scanners)
		dat #0
stophim 	add #step, dropbomb
dropbomb  	mov jbomb, init 	; Bomber minnet med JMP 0.
		djn stophim, #repeat	; Etter at alle er bombet, vil
					; programmet gaa over i KILL-fasen.



					; dropbomb + 2 is bombed, but not
					; until after this code has been run.
		spl stophim		; Keep bombing with JMP 0's.
s1 		spl kill1 + dropbomb	; Killer routine 1.
s2 		spl kill2 + dropbomb	; Killer routine 2.
s3 		spl kill3 + dropbomb	; Killer routine 3.
s4 		spl kill4 + dropbomb	; Killer routine 4
		jmp kill		; Killer routine 5 (last to die.)



		dat #0
		dat #0
		dat #0	; 5  bombes med JMP 0
		dat #0
		dat #0
		dat #0
		dat #0
		dat #0	; 10  bombes med JMP 0
		dat #0
		dat #0
		dat #0
		dat #0
		dat #0	; 15  bombes med JMP 0
		dat #0
		dat #0
		dat #0
		dat #0
		dat #0	; 20  bombes med JMP 0
		dat #0

		end start








;	jmp 1
;	jmp 1
;	jmp 1
;	jmp 1
;	jmp 1
;	jmp stophim
