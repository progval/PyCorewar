;redcode-b quiet
;name oldtimer
;author bjoern guenzel
;strategy I didn't manage to create a silk-style copyroutine,
;strategy so I use a kind of '88 style :-( It's damn difficult
;strategy to find non-suicidal constants (let alone effective ones)
;strategy I am sorry to say, but this is actually a kind of paper...
;assert CORESIZE==8000 && MAXPROCESSES==8
;release 1.5.96

size    equ (base-ptr)
off     equ (8*17)      ;constants not optimised, simply the first
boff    equ (2667)      ;that weren't suicidal
rel     equ 91

ptr     dat 0,0
new     add.ab #rel,base
first   mov.i base,ptr
loop    mov.i *ptr,<ptr
        mov.i base,}boff
        djn.a loop,ptr
        spl new,0       ;if there is a spare process (because another died),
        jmp @ptr,0      ;a new copy is build
base    dat <size,<size+off

        end first
