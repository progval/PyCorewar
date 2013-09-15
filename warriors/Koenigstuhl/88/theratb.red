;redcode
;name TheRat B
;author Arne H. Juul
;from: Arne Henrik Juul <arnej@lise.unit.no>
;assert 1
;strategy Bomb mod-4 locations with JMPs leading to a splitting &
;strategy bombing routine, hopefully making the enemy do the work.
;strategy Modified from wms' Leech 1.1, with a false clue to survive
;strategy my own antileech routine.
;strategy B version: should now also be immune against B field
;strategy hunters.

rand	EQU	(875*4)		; Just a random number
carrotp	EQU	(carrot-rand)
offp	EQU	(off-rand)
bdist	EQU	(767*4)

	DAT	#0
clue	JMP	drain+rand, 0
off	DAT	#-bdist, #bdist
carrot	JMP	clue, 0

	DAT	#0
	DAT	#19
	DAT	#25


movit	MOV	<wf,<wt
	JMN	movit,wf
	JMP	leech+rand

wt	DAT	#etext+1+rand
wf	DAT	#etext+1

leech	MOV	carrotp, @carrotp
	ADD	offp, carrotp
	JMP	leech

	DAT	#0		; carrot lands here

drain	MOV	offp, <clrloc
clrloc	SPL	drain, leech
etext	JMP	drain, 0

	DAT	#0		; carrot lands here
	DAT	#0
	DAT	#0
	DAT	#0
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157
	DAT	#-512, #157

	end	movit
