;redcode-94
;name Anti-Dwarf
;author Philip Kendall
;strategy Kill Dwarf
;assert CORESIZE==8000

gate    equ     (foo-8)

start   spl     2
foo     djn.f   #0,<gate
        djn.f   #0,<(gate+1)
        
        end     start
