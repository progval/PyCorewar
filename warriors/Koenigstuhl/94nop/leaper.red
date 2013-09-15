;redcode-94
;name Leaper-X 4.0
;author Jeff Raven
;assert 1
;strategy - Leaps through memory, bombing as it goes. The bombing routine
;strategy - has been changed - and hopefully improved. It now uses a more
;strategy - efficient bombing pattern, which should almost halve the time
;strategy - it takes to clear the core.

lines   EQU 14
limit   EQU 250
reach   EQU 125
upper   EQU reach
lower   EQU -reach
leap    EQU limit - (storage - copy)
time    EQU 32

low     DAT #0

start   MOV #lower, low
        MOV #upper, high
        DJN splat, slow
        MOV #0, point
splat   MOV @point, >low
        MOV @point, @high
        DJN splat, high
        MOV #lines, low
        MOV #leap, storage
copy    MOV @low, <storage
        DJN copy, low
storage JMP @storage

point   DAT #slow
slow    SPL slow, time
high    DAT #0

        END start
