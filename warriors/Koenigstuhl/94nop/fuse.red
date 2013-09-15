;redcode-94nop
;name Fuse
;author Myer Bremer
;strategy testing some hybrid strategies
;strategy stone -> s/s/d clear
;strategy 
;strategy thanks to joonas for some good insight
;assert 1
;optimax stn

wtop	dat 67, 2800

	dat 0, 0
	dat 0, 0
	dat 0, 0
	dat 0, 0

wipe    spl   #wend-wtop, -1 ; better clear than my first attempt
        mov @wend, }wtop
        mov @wend, }wtop
        mov @wend, }wtop
	djn.f -2, <wtop
        dat <5334, <2667      
        spl #wend-wtop, -2    
wend    spl #wend-wtop, wipe
for 58
	dat 0, 0
rof	

gogo	sub.x 4, 1
	mov.i }2804, 70 ; 4000,4; 2800, 8
	jmz.f -2, {-1
	add.a -2, wtop
	jmp.a -70, -8

end gogo
