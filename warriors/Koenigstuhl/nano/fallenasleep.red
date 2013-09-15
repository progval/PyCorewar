;redcode
;name Fallen Asleep
;author LAchi
;strategy Smart Cabrio for IRCT
;assert 1

Stone     spl    #-76,#76     ; self-splitting, unbooted stone
         mov    -2,-13      ; with sequential core clear
         add    Stone,1
         mov    0,-3
         jmp  -2,<-3

	end Stone

