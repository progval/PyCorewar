;redcode-94
;name Death by Numbers
;author Ian Oversby
;strategy Blur-type scanner
;strategy No JMP, LDP, #, *, .I or .BA
;assert 1

step    equ     70
gate    equ     top

org     scan

ptr     nop.f   800,    4000
bomb    nop.f   1,      1
top     mov.f   bomb,   >ptr
scan    seq.b   2*step+5,2*step
        mov.b   scan,   ptr
        add.f   inc,    scan
        djn.a   top,    ptr
        spl.b   0,      0
        mov.f   inc,    >gate
        djn.f   -1,     >gate
inc     dat.f   >70,    >70

end
