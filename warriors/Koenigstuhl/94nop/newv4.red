;redcode-icws verbose
;name Newv4
;author Androsch Rene
;strategy Just mess up the hole core
;assert CORESIZE == 8000


	org viri_1


trowb   djn t1 , <-1
t1	jmp trowb
trowf	djn f1 , >2666
f1	jmp trowf

tie1	djn 1 , >10
tie2	add #2 , tie1
tie3	jmp -2

q2	dat #4000

viri_1  spl imp			; here is the entrypoint for viri_1
	spl trowf
	spl trowb
strt1	djn s0 , 500
s0	djn s1 , -11
s1	djn s2 , 30
s2	add #4 , strt1
q1	mov tie1 , >q2
	mov tie2 , >q2
	mov tie3 , q2
	sub #3 , q2
	spl @q2
	add #30 , q2	
   	jmp strt1
imp 	mov 0 , 2
	mov 0 , 2
