;redcode-94 verbose
;name Koolaid II: WoGG v2.2
;author David Boeren
;assert CORESIZE == 8000
;strategy Koolaid II: The Wrath of Goofy Grape v2.2
;strategy heavy stun bomber -> coreclear
;strategy     v0.1 New bombing engine with ideas from Tornado
;strategy     v2.0 Major rewrite for smaller code
;strategy     v2.1 Improved coreclear
;strategy     v2.2 Added boot & decoy
 
step    equ 184                     ; modulo 8 bombing
stepb   equ (step*2)
stepc   equ (step*3)
gate    equ ptr-7
 
        org boot
ptr     JMP.B      step,       #2
        DAT.F       #16,       #0
        SPL.B       #16,       #1
bomb1   SPL.B        #2,   #-step
bomb2   MOV.I        -1,      }-1   ; heavy stun bomb
loop    MOV.I     bomb2,    @targ
        MOV.I     bomb1,    <targ
        MOV.I       ptr,    *targ   ; ptr doubles as vamp
targ    MOV.I      step, @stepc+1
        ADD.F       inc,     targ
        DJN.B      loop,     #333   ; (8000/modulo)-1 bombs will be dropped
inc     SPL.B    #stepc, #stepc+1
clear   MOV.I      @ptr,     }ptr   ; Coreclear modified from Phosphorus
        DJN.F     clear,    <gate
 
boot    MOV.I   clear+1,     3198   ; fast boot away tail first
for 13
        MOV.I     {boot,    <boot
rof
        ADD.AB       #5,     boot   ; adjust so we split to "loop"
        SPL.B     @boot,       #1   ; split to main program
        MOV.I         0,     boot   ; obliterate boot pointer
for (MAXLENGTH-CURLINE) / 4
        DAT.F      loop,    clear   ; big decoy to confuse scanners
        DAT.F      targ,     boot   ; No two are alike!
        DAT.F      boot,     targ
        DAT.F     clear,     loop
rof
        END
 

