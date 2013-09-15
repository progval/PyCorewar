;redcode-94
;name DwarfBomb
;author Ben Snitkoff
;assert 1

dwarf:  ADD #12, 2
        SUB #12, 2
        MOV bomb, 6
        MOV bomb, 6
        JMP -4
bomb:   DAT #33, #33
    
    
main:   ADD #800, 7
        ADD #800, 7
        ADD #800, 7
        ADD #800, 7
        ADD #800, 7
        ADD #800, 7
        ADD #800, 7
        MOV dwarf, 8
        MOV dwarf+1, 8
        MOV dwarf+2, 8
        MOV dwarf+3, 8
        MOV dwarf+4, 8
        MOV dwarf+5, 8
        SPL @-6
        JMP main
        
        end main

