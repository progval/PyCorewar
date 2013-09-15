;redcode
;name +0 Stormbringer
;strategy optimized Imprimis 3
;author D.Nabutovsky, P.Kline
;assert CORESIZE==8000
d        equ 2667
r        equ 1333
datzero  equ (inc-5)

inc      dat #0-2365,#2365
dwarf    spl 0
loop     mov <cnt-2365-2,<cnt+2365-1
         add inc,loop
cnt      djn loop,<5061

datz1   dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
rf34    dat #5635,#2365
        spl 0
        mov <5635,<2366
        add 7997,7999
        djn 7998,<5061
datz2   dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
rf49    dat #5635,#2365
        spl 0
        mov <5635,<2366
        add 7997,7999
        djn 7998,<5061
datz3   dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0

start: spl 32
spl 1
spl 16
spl 8
spl 4
spl 2
jmp i+d*0
jmp i+d*1
spl 2
jmp i+d*2
jmp i+d*3
spl 4
spl 2
jmp i+d*4
jmp i+d*5
spl 2
jmp i+d*6
jmp i+d*7
spl 8
spl 4
spl 2
jmp i+d*8
jmp dwarf
spl 2
jmp dwarf+3
jmp dwarf+2
spl 4
spl 2
jmp dwarf+1
jmp dwarf
spl 2
jmp <0, dwarf+4
jmp <0, dwarf+2

        DAT #0
        DAT #0
        DAT #0
        DAT #0
        DAT #0
        DAT #0

i       mov 0,2667

end start
