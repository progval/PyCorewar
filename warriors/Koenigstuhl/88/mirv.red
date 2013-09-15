;redcode
;name MIRV
;author Strike
;strategy  mega imprush in front
;strategy  dwarfbomb to rear
;strategy version 0.2.2
;assert 1

DEPLOY2: DAT  #     0, #   -40     
DEPLOY1: DAT  #     0, #    40     
START:   MOV   IMPBOMB, @DEPLOY1 ;toss new impbomb     
         SPL       2             
         JMP  @   -3             ;execute imp
         SPL      -3             ;repeat impbombing
         ADD #    50, @DEPLOY1   ;increment bombing locations 
         SUB #    45, @   -7     
         MOV    BOMB, <    3     ;<blink> whats that b-field doing??
         JMP      -1             ;keep bombing
BOMB:    DAT              #-10     
IMPBOMB: MOV       0,      1     

	END START
