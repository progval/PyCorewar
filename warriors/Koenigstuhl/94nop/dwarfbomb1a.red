;redcode-94
;name DwarfBomb (v1a)
;author Ben Snitkoff
;       + some improvements by CCB 
;stategy Dwarf throwing dwarf
;assert 1

bomb:   DAT #33, #33		; move here from after 'jmp dwarf' (CCB)
dwarf:  ADD #12, 2
        SUB #12, 2
        MOV bomb, 6
        MOV bomb, 6
        JMP dwarf
    
    
main:   ADD #800, $ptr		; changed to '$' from '@' (CCB)
ptr:    NOP #0, 8		; changed from DAT (CCB)
        MOV bomb,   >ptr        ; changed to '>' from '@' (CCB)
        MOV bomb+1, >ptr        ; changed 'dwarf' to 'bomb' (CCB)
        MOV bomb+2, >ptr
        MOV bomb+3, >ptr
        MOV bomb+4, >ptr
        MOV bomb+5, >ptr
        SPL <ptr		; changed to '-7' from '-6' (CCB)
        JMP main
        
        end main

