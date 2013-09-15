;redcode-b
;name tie-die
;author WFB
;strategy bombs with jmp and dat.
;assert CORESIZE==8000
start: mov hide,-2997
spl bomber
add #4,aimer
mov bomb1,@aimer
jmp -2
bomb1: jmp 101,<1
aimer:  dat #0,#0
bomber: mov bomb2,@aimer+101
jmp -1
bomb2:  dat #0,#0
hide: jmp hide,<5000
end start
