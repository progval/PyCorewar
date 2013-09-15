;redcode-94m
;name Sharkrage
;author Christian Schmidt
;strategy scanner
;assert 1

step    equ     2936
scans   equ     400
decoy   equ     (scan-1200)

        org     start

clrptr  dat     2000,   0
clrbmb2 dat     {20,    <2667
clrbmb  spl     #25,    100
scnloop add     clear,  scan
scan    seq.a   -10,    -2
        mov.a   scan,   clrptr
        djn     scnloop,#scans
clear   spl     #step,  <step
clrloop mov     clrbmb, }clrptr
        mov     clrbmb, }clrptr
        mov     clrbmb, }clrptr
        djn.a   clrloop,>clrbmb
        jmp     clrloop,>clrbmb

        for     81
        dat     0,      0
        rof

start    mov    <decoy+0,{decoy+2
          mov    <decoy+3,{decoy+5
          mov    <decoy+6,{decoy+8
        spl     scnloop , <decoy+10
          djn.f  clrloop+1  ,<decoy+12

end

