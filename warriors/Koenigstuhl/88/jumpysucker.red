;redcode verbose
;name Jumpy Little Sucker (v0.0)
;author Peter Ivanyi
;strategy Turn it off before the s... hits you!
;assert 1

start   MOV target, <target	;quick start,
        MOV bomber, <target	;to have a second copy in case of damage
        MOV split, <target
        MOV add8, <target
        MOV jump, <target
        MOV loop, <target
        JMP split
        DAT #0			;maybe help avoid the damage in early stage
        DAT #0
        DAT #0
        DAT #0
        DAT #0
        DAT #0
        DAT #0
        DAT #0
        DAT #0
        DAT #0
        DAT #0
        DAT #0
bomb    MOV #0, 8		;bomb, and a counter for copying
loop    MOV @bomb, <target	;copying
jump    DJN loop, bomb
add8    ADD #8, bomb		;correct the counter
split   SPL @target		;split to the new copy
bomber  MOV bomb, <target	;start bombing fast
target  JMP bomber, #1000
        END start

