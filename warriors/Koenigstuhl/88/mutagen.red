;redcode
;name Mutagen
;author Stefan Strack
;strategy laces the core with crippling point-mutations and cleans up
;strategy the debris with systematic deletions
;assert 1

start   mov     <-50,   <-50
        add     #422,   loc
loc     djn     start,  <0
        jmp     start
        end     start
