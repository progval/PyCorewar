;redcode-94
;name DwarfBomb (v1b)
;author Ben Snitkoff
;       + some improvements by PVK
;stategy Dwarf throwing dwarf
;strategy [PVK] Actually, it's more like a warrior that spawns tons of
;strategy       stones, since the "main" part isnt a dwarf. Anyway...
;assert 1

        org main

bomb:   DAT #12, #-12           ;You could use antoher stepsize...3044, fe.
dwarf:  ADD bomb, 1		  ; move here from after 'jmp dwarf' (CCB)
        MOV bomb, 6
        JMP dwarf  ; in most warriors, this would be a djn, but then,
		 ;most warriors also have a spl 0 on the top of the loop... 
		; you could still do it, though

main:   ADD #800-3, $ptr     ; changed to '$' from '@' (CCB) [PVK]
				;Changed the step so
  ; the loop rolls perfectly around the core
  ; (the ">" change the value of ptr's b-field too)

        MOV bomb,   >ptr        ; changed to '>' from '@' (CCB)
        MOV bomb+1, >ptr        ; changed 'dwarf' to 'bomb' (CCB)
        MOV bomb+2, >ptr
        MOV bomb+3, >ptr
        SPL <ptr                 ; changed to '-7' from '-6' (CCB)
        JMP main
ptr:    DAT #0, bomb+3           ;Changed so that the original dwarf is
				; overwritten(under
; the previous build, the main program could have overwritten itself 
; with a dwarf)
        end


