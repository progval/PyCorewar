;redcode-lp
;name Rosen 6.042J -- v0.03
;author George Eadon
;strategy self-splitting bomber -> Coreclear -- for Limited Process Hills...
;strategy I don't really understand why it doesn't seem to work very well.
;strategy This should have have a fighting chance against other stones
;strategy and should tie against most imps...
;assert CORESIZE==8000 && MAXPROCESSES==8 && MAXLENGTH==200
; Although its designed for 8 processes, this isn't crucial

; decoy
	dat	1, 1
	dat	2, 4
	dat	3, 9
	dat	4, 16
	dat	5, 25
	dat	6, 36
	dat	7, 49
	dat	8, 64
	dat 	9, 81
	dat	10, 100
	dat	11, 121
	dat	12, 144

for	150
	dat	0, 0
rof

STEP 	EQU	5*641

inc	dat	<-STEP, <STEP
	dat 	pos+1 - bomb, 0
	spl	0, 0
loop	add     inc, pos
start	mov	bomb, @pos
	mov	bomb, *pos
pos	mov	-STEP, @STEP
	djn	loop, #800
        spl	0, 0
	mov	inc+1, {bomb
	jmp	-2, 0
bomb	dat	pos+1, <-2

end	loop-1

