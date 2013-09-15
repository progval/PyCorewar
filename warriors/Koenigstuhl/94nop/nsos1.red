;redcode
;name NSos1
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy oneshot

;*****constants*****
step1 equ 2793
step2 equ 1175
step3 equ 17
step4 equ 2296
count equ 500

	org scan
beg	add jos1, scan
	add jos2, scan1
scan	sne.i -153, beg-1+1255
scan1	seq.i 183, beg-2+848
	slt.ab #(jos2-beg+10), -1
decr	djn.b beg, #count
	jmp attack, 0
sample	dat 0, 0
	for 25
	dat 0, 0
	rof
attack	jmz.b finish, decr
	seq.i *scan, @scan
	jmp dva, 0
	mov.b scan1, pok
	sne.i sample, @scan1
	mov.ab scan1, pok
	jmp finish
dva	seq.i sample, *scan
	jmp tri, 0
	slt.ab #(jos2-beg+10), scan
	jmp beg, 0
	mov.b scan, pok
	jmp finish, 0
tri	slt.a #(jos2-beg+10), scan
	jmp beg, 0
	mov.ab scan, pok
	jmp finish, 0
	for 30
	dat 0, 0
	rof
finish	spl #-1, #-20
	mov *pok, <pok
	jmp -1, <-30
	dat <2667, <2*2667
	spl #-2, #-20
pok	dat #-5, #-120
jos1	dat #step1, #step2
jos2	dat #step3, #step4
	end

