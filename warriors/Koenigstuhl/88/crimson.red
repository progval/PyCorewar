;redcode-x verbose
;name Crimson v1.1
;author J.Cisek
;strategy creation date 4/26/92
;strategy This is my first program designed specifically
;strategy  for the KotH experimental hill.
;strategy  Bombs the local area, then jumps to the next area.
;strategy  Traps the first time through core, clears the second.
;strategy  v1.1 4/29/92 Doesn't leave back uncovered anymore.
;assert 1
STEP	equ -150			; new copy offset
TRAPS	equ 1				; space between traps
NTRAPS	equ 64				; number of traps [STEP+50 / (TRAPS+2)]
JUMPS	equ 50				; number of times we trap

length	dat #0, #0			; program data
split	spl 0, #0
jump	jmp split, #0

start	mov #NTRAPS, jump		; use jump to store this counter

attack	mov jump, <length		; 2nd piece of trap
	mov split, <length		; 1st piece of trap
	sub #TRAPS, length		; point to new trap
	djn attack, jump		; attack NTRAPS times

	djn normal, done		; after we jump through the core
	mov length, split		;  JUMPS times, start killing

normal	mov #done-length+1, length	; set up copy source
	mov #STEP, split		; set up copy destination
copy	mov <length, <split		; copy 
	jmn copy, length

	add #3, split			; point to new start point
done	jmp @split, #JUMPS		; transfer control there

	end start

; This warrior is designed for the KotH experimental hill which has the
;  following settings: Post-increment is allowed, warriors can only change
;  memory locations within 250 of the current instruction.

; While it does work under ICWS'88, don't bother running this warrior in a
;  regular tournament, or under any rules which allow writing to a greater
;  address range

