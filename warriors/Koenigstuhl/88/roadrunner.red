;redcode verbose
;Name		RoadRunner D
;Author		S. Halvorsen
;Address	snh@flipper.pvv.unit.no
;assert 1
;Strategy	Fill the core with DAT's at speed = c/2.
;Strategy	This is a modification to version B that
;Strategy	should make it better against bombers and
;Strategy	scanners.
;Strategy	(  Put some DAT #0's between code   )
;Strategy	( and DAT's with non-zero B-fields. )
;Strategy	( "Bug fix", changed some constants.)

; Avstanden mellom kode og data boer vaere 35 og 36 !
; Dette gjoer at det er forholdsvis tett kode, samt at
; mod 3,4,5,6,7,9, og 12 bombers/scanners som bommer
; paa koden, ogsaa bommer paa dataene.
; Mod 8 bommer paa dataene 4 av de 5 gangene den bommer
; paa koden, noe som er akseptabelt.
; Endret koden slik at den bomber tre fjerdedeler av
; minnet i stedenfor bare halve. (Kopien bomber annenhver,
; og den opprinnelige delen de andre annenhver.)


init	equ  (b - d + 4)	; The pointer that tells which location to
				; bomb is initialized to this value.

other	equ  -5 		; Points to the copy. The original program
				; overwrites the copy if it (the original)
				; is still working after about 8000 cycles.
				; If not, the copy will overwrite the now
				; nonfunctional original.
				; As an extra, if both parts of the program
				; works, half of the core will be bombed on
				; EVERY location, the other half on only
				; every second location.


del	dat #0
count	dat #nulle - del		; Deletes the initial code in order
delete	mov del,<count			; to avoid scanners. Probably not
	jmp delete			; necessary, but it makes me feel good.

start	mov b, b + other		;  Makes an extra copy of itself
	mov A, A + other	; on the other side of the memory
	mov A + 1, A + other +1	; that "cover the back" of this
	mov d, d + other		; code. Each copy only destroys
nulle	spl delete			; half the memory, unless the other
	spl A + other + 1		; is destroyed by the enemy !
	jmp A + 1

	dat #0
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0
b	dat #init		; Data area that causes the program to
	dat #0 ;-35		; skip itself after it has filled every
	dat #0			; second location with DAT's.
	dat #0
	dat #0
	dat #0
	dat #0 ;-30
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0 ;-25
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0 ;-20
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0 ;-15
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0 ;-10
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0 ;-5
	dat #0
	dat #0
	dat #0
	dat #0
A	mov b, <d		; This code put a DAT out to the core at every
	djn A, d		; second location, and does it every second
				; tick.  i.e fast and small !
	dat #0
	dat #0
	dat #0
	dat #0 ;5
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0 ;10
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0 ;15
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0 ;20
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0 ;25
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0 ;30
	dat #0
	dat #0
	dat #0
	dat #0
	dat #0 ;35
d      dat #init		; Pointer to the location that will be bombed.
	dat #0
	dat #0
	dat #0


	end start

