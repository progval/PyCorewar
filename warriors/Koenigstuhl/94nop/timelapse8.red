;redcode-94 verbose
;name Time Lapse v0.8
;author David Boeren
;assert CORESIZE == 8000
;strategy Bomber -> SPL/DAT coreclear
;strategy     v0.1 Fast bomber, does not use stun bombs
;strategy     v0.2 Added boot & decoy
;strategy     v0.8 Experiment with new bomb

step    equ 184
stepb   equ (step*2)
stepc   equ (step*3)
gate    equ loop-7

        org boot
ptr     DAT.F     #step,       #2
        DAT.F       #16,       #0
        SPL.B       #16,       #1
loop    MOV.I       ptr,    *targ   ; Tornado bombing
        MOV.I       ptr,    @targ
targ    MOV.I      step,   *stepb
        ADD.F       inc,     targ
        DJN.B      loop,     #333
inc     SPL.B    #stepc,   #stepc
clear   MOV.I      @ptr,     }ptr   ; Coreclear modified from Phosphorus
        DJN.F     clear,    <gate

boot    MOV.I   clear+1,     3198   ; fast boot away tail first
for 10
        MOV.I     {boot,    <boot
rof
        ADD.AB       #3,     boot   ; adjust so we split to "loop"
        SPL.B     @boot,       #1   ; split to main program
        MOV.I         0,     boot   ; obliterate boot pointer
        DAT.F      >100,     >101   ; die in a core-coloring way
for (MAXLENGTH-CURLINE) / 4
        DAT.F      loop,    clear   ; big decoy to confuse scanners
        DAT.F      targ,     boot   ; No two are alike!
        DAT.F      boot,     targ
        DAT.F     clear,     loop
rof
        END



