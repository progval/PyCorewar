;redcode-b
;assert 1
;name Body-Snatcher3
;author Calvin Loh
;strategy Core program keeps on splitting off processes.
;strategy Each split also decrements a gate.
;strategy Program continually sends a pointer backwards.
;strategy If the pointer lands on enemy code, it will execute the
;strategy enemy code.
gate    equ     key-5
place   equ     key-6
key     spl     0,      <gate
        jmp     @place, <place
end     key
