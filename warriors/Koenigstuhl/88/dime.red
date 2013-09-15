;redcode
;name DIME
;author Stefan Haenssgen
;(hanssgen@ira.uka.de)
;strategy  Mutation of QUARTER: Spawn eight fast two-instruction killers and let
;strategy  them cover the core quickly. New modified bomber routine, better
;strategy  placement in core (equally distributed, every 2nd killer placed
;strategy  with offset of 1, i.e. even/odd addresses)
;assert CORESIZE==8000
;
;               DIME       by Stefan Haenssgen
;
;

;slen	EQU	8000		; Core size
;dist	EQU	(loop - z1)	; Offset to counters

z1	DAT	#1032		; Pointer to copies, the Killers are
z2	DAT	#2030		; placed at equal distances in memory
z3	DAT	#3030
z4	DAT	#4028
z5	DAT	#5028
z6	DAT	#6026
z7	DAT	#7026

start	MOV	kill , <z1	; Copy one killer
	MOV	loop , <z1	; (no fancy loops here, we want speed!)
	MOV	kill , <z2	; Copy the next one
	MOV	loop , <z2
	MOV	kill , <z3	; etc pp
	MOV	loop , <z3
	MOV	kill , <z4
	MOV	loop , <z4
	MOV	kill , <z5
	MOV	loop , <z5
	MOV	kill , <z6
	MOV	loop , <z6
	MOV	kill , <z7
	MOV	loop , <z7
	SPL	@z1		; Done copying, now start the killers
	SPL	@z2
	SPL	@z3
	SPL	@z4
	SPL	@z5
	SPL	@z6
	SPL	@z7
	JMP	loop		; Start the eigth killer

ptr	DAT	#0		; Pointer to target (not copied, since ..
				; .. core is initialized with "DAT #0")
loop	MOV	ptr  , <ptr	; Bomb with DATs ..
kill	JMP	loop , <ptr	; .. every second location in memory

	END	start		; Start program execution at label "start"
