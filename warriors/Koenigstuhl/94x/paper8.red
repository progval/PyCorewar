;redcode-94x
;name Paper8-IV (54400)
;strategy 8-Process Paper
;author G. Eadon
;NSFCWT #8
;contact gmeadon@mit.edu
;assert 1

start	spl   	1, <2000
	spl	1, <4000
	spl	1, <6000

silk1   spl     11620, #0      	;split to new copy
        mov.i   >-1, }-1     	;copy self to new location
	mov	<silk1, {copy2
copy2	spl	15660, #0
	mov.i	bomb1, {3000
	mov.i	bomb1, <2000
	jmz	-2, silk1
bomb1 	dat.f   0, 0

	end	start

