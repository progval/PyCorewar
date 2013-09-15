;redcode
;name Split-pit
;author David Boozer
;Strategy Bomb core with JMP's to a "pit", then clear the core. Pit 
;Strategy causes opponent to clear core forwards, while clear core
;Strategy routine clears core backwards.
;assert 1

loop: mov   ptr, @ptr   ; Bomb core with JMP instructions
		sub   info, ptr
		djn   loop, #421
		mov   #421, -1
		djn   -3, #6
		jmp   clear       ; Clear the core with DAT's
		dat   #0          ; 0's used to hide from scanners     
		dat   #0     
		dat   #0
		dat   #0
		dat   #0
ptr   jmp   trap, #0    ; JMP instruction used to bomb core
		dat   #0
		dat   #0
		dat   #0
		dat   #0
		dat   #0 
		dat   #0      
		dat   #0      
		dat   #0      
		dat   #0      
		dat   #0      
		dat   #0      
		dat   #0      
		dat   #0      
		dat   #0      
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0      
		dat   #0     
info  mov   #-19, <19   ; Spacing of bombs
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
clear mov   dat0, <index   ; Clear out the core, moving backwards
		jmp   clear
dat0  dat   #-3            ; Clear routine will overwrite it's own index,
index dat   #-3            ; thus preventing it from bombing itself
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
		dat   #0     
trap  spl   0, #0       ; "Pit" in which opponent is trapped
		mov   dat0, @3    ; Clear out the core, moving forwards
		add   #1, 2
		jmp   trap, #0
		dat   #1     
		end   loop
