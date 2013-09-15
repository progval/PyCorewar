;redcode-icws verbose
;name Switch It v2.2
;author Androsch Rene
;strategy P-Warrior, using an Imp , an backward Bomber , an ImpStoper
;strategy and one MESS UP Warrior.
;strategy optimized version that changes even at a tie
;assert CORESIZE == 8000

	org start

; ----- Switch to our next warrior ---------

start	ldp.ab  #0,   	#0      ;load result last match
str	ldp	#1,   	str1    ;load strategy in use
	seq.ab  #1,     start   ;check result, win OK
losttie	add     #1,     str1    ;lost and tie change 
        mod     #4,     str1    ;secure jump     
win	stp.ab  str1,   #1      ;save strategy
	jmp 	2
str1	dat	#0
	sne	#0,	str1    
	jmp	viri_1
	sne	#1,	str1
	jmp	viri_2
        sne     #2,     str1
	jmp 	viri_3			
	sne	#3,	str1
        jmp     viri_4
	jmp	viri_5


; ----- Now the redcodes ---------


; ------------------------------------------
; New v3, just mess up the hole core......

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


; ------------------------------------------
; An Imp and an bomber that tries to bomb few locations.

bmbd	dat	#10,	#10
bmbs	spl	0,	0
bmbj	jmp	734
adr	dat	#2667
adr2	dat	#-250
adr3	dat	#400
adr4	dat	#4000
adr5	dat	#6000
tieh	jmp	0
copybmb	mov	minus,	adr5
	mov	m1,	>adr5
	mov	m2,	>adr5
	mov	m3,	>adr5
	sub	#3,	adr5
	spl	@adr5
	add	#300,	adr5
	jmp	copybmb
tiecode	mov	tieh,	@adr
	jmp	adr
minus	djn	minus,	-200
m1	djn	minus,	-201
m2	djn	minus,	-202
m3	jmp	minus
plus	add	#50,	@adr3
p1	add	#4,	adr3
p2	jmp 	plus
viri_2	spl 	copybmb			; here is the entrypoint for viri_2
	spl	ip
	spl	tiecode
	spl	minus
	spl	plus
strbmb	mov	bmbd,	>adr  	; @adr
	mov	bmbs,	<adr2 	; @adr2
	mov	bmbj,	>adr4	; @adr4
	jmp	strbmb
ip	mov	0,	1





; ------------------------------------------
; Mini Imp , just another Imp


bomb	spl 0 , 0
viri_3  mov bomb  , 2667	; here is the entrypoint for viri_3
strt2   mov bomb  , -2667
        add #4  , start
        sub #4  , strt2
	mov bomb , -6
        spl body
        mov 2 , -1
        jmp viri_3
        jmp -4
body    mov 0 , 1




; ------------------------------------------
; Just running backwards and decreasing everything


viri_4	sub	#3,	-1	; here is the entrypoint for viri_4
	sub	#4,	viri_4
	jmp	viri_4


; ------------------------------------------
; UnImp , this should stop an imp


status0	dat	#-5
viri_5  mov     2       , <status0	; here is the entrypoint for viri_5
        jmp     viri_5
	dat	#0	, #0
