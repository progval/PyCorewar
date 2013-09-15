;redcode-94x
;assert CORESIZE==800
;name little goonie
;author David Moore
;strategy two-shot scanner
;strategy (one for each opponent)

org start

gate    dat      0,   0
        dat   <534, <267
        dat     -1,  11
clear   spl   #367,  13
        mov  clear, >gate
g       mov    *-1, >gate
        djn.a   -2,  gate
        djn.a   -3, *-1

    for 6
;       dat 1, 1   ; round 10 "Tri-Tiny" version
        dat 0, 0   ; normal version
    rof

start   spl 3, >602  ; two processes in scan loop
        sub.f step,  scan
scan    sne     19,  19 + 6
        jmp     -2,  {628
        mov.ab scan, @g
step    djn.f clear+1, #clear+1

end
