;redcode verbose
;name Overload 1.1
;author Jeff Raven
;assert 1
;strategy - Version 1.1
;strategy - Overload scans the core, and, upon finding another program,
;strategy - executes it. Not particularly aggressive, it tends to tie
;strategy - programs which make lots of copies.
;

first   EQU 0                  ; First address checked by scanner
step    EQU 3044               ; Step size for the search

bomb    DAT #0

start   ADD #step, locus
locus   JMZ start, first
        SPL @locus
        MOV 0, 0
        MOV bomb, @locus
        JMP start

        END start
