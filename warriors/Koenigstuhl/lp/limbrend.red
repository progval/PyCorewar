;redcode-lp
;name Limb Rending Incisors
;author Ian Sutton
;strategy Vampire
;strategy Vamp enemy into the pit or stun him with JMP 0, then dual clear
;strategy v1.5 Fixed a few bugs
;assert CORESIZE == 8000

; All these numbers are the same.
; If you think I'm going to spend another hour+ to get it working again
; with different numbers then you've got a screw loose!
step	equ	15
stfang	equ	(stcode-7981+step*3)
sboot	equ	(main+2541)

	org	start

; --The Sneak--
; This is backwards clear which will be booted away
main	dat	0, 0
sneak	mov	bomb, <bclear
	jmp	-1, <bclear
	dat	0,0
	dat	0,0
	dat	0,0
bomb	dat	0, -11
bclear	dat	0, -31


; Begin here
; |
; v
start
; Note the cheese boot.  I didn't use a boot ptr but I'm not too worried
; about it and I also copied some useless dats.  I always release warriors
; with bugs and irrelevancies but can't be bothered to fix 'em.
	mov	sneak+0, sboot+0
	mov	sneak+1, sboot+1
	mov	sneak+2, sboot+2
	mov	sneak+3, sboot+3
	mov	sneak+4, sboot+4
	mov	sneak+5, sboot+5
	mov	sneak+6, sboot+6
; 1 process to the sneak
	spl	sboot

; 5 processes to the vamp
	spl	vamp
	spl	vamp
	spl	vamp
	spl	vamp
	spl	vamp

; 1 process to the forward clear
	jmp	myclear


	for	34
	dat	0, 0
	rof


; ---PIT---
pit	spl	1, pclear
	mov	dbomb, >pclear
hit1	jmp	pit, pclear
; ---------


	dat	0, 0
	dat	0, 0
	dat	0, 0
	dat	0, 0

hit2	dat	0, 0
	dat	0, 0
	dat	0, 0
pclear	dat	0, 50
	dat	0, 0

hit3	dat	0, 0
	dat	0, 0
	dat	0, 0
	dat	0, 0
jbomb	jmp	#0, #0

hit4	dat	0, 0


; --Bomber--
stcode
inc	spl	#-step, step
	dat	0,0
vamp	add	inc, fang
pfang	mov	fang, @fang     ; drop fang
	mov	jbomb, *fang    ; drop jmp bomb
	jmp	vamp, @pfang    ; My memory's hazy about this line
                                ; a jmp vamp, 0 should work exactly the same
	dat	0, 0
; --Clear--
; works with the same ptr as the pit for a fast clear (max 200% c with enemy)
myclear	mov	dbomb, >pclear
	jmp	myclear, pclear

hit5	dat	0,0
dbomb	dat	0, 50
	dat	0, 0
	dat	0, 0
fang	jmp	pit-stfang, stfang

