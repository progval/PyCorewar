;redcode
;name ARMY
;author Neil Robertson
;strategy - copy itself to a location 300 ahead then bomb either side of  
;strategy - itself using dwarfs which are reset when there bomb runs are
;strategy - getting close to the next copy of army
;assert 1

	dat #22
	dat #300
start:  mov <-2,<-1
	jmn start,-3
	mov #22,275
	mov #300,275
        spl 275 
        spl check
	jmp dwfs
 datd:  dat #-9
 dwfs:  spl 5
	mov -2,@-2
	sub #7,-3 
	jmp -2
 datu:  dat #9
	mov -1,@-1
	add #7,-2
	jmp -2
check:	slt #250,datu
	jmp -1
	mov #-9,datd
	mov #9,datu
	jmp check 
	end start	
