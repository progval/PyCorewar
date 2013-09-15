;redcode
;name SpamwichII
;author ImarRann
;<imarr@lop.com>
;assert 1 

jmp 	3		; BEGIN Spawn code
dat 	#10, 	#-3	; A=current inst. B=3-(sizeof(Radial-Dwarf code))
dat 	#7920,	#0	; A=(InitDrop)
mov 	}-2, 	}-1
jmz 	-1, 	>-3
mov.a   #10,  	$-4
mov.ab  #-3,  	$-5
spl    	7915		; A=(InitDrop-5)
add.a   #654,  	$-6	; A=(DropInterval-6)
add.a   #660,  	$-2	; B=(DropInterval)
jmp 	-10		; END	Spawn code
mov     5, 	*5 	; BEGIN Radial-Dwarf Code
mov     4, 	@4
add.ab  #2, 	$3
sub.a   #2, 	$2
jmp     -4
dat     #-6, 	#1	; END	Radial-Dwarf Code
