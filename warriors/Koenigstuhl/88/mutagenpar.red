;redcode
;name MUTAGEN /PAR
;author Stefan Strack
;(stst@vuse.vanderbilt.edu)
;strategy laces the core with crippling point-mutations and cleans up
;strategy the debris with systematic deletions (parallel version)
;assert 1

dist    equ     422

start   mov     <start-1, <start-1
        add     #dist,  loc
loc     djn     start,  <0
        jmp     start

        end     start
