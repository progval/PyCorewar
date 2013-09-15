;redcode-b
;name El Cheapo Scanner
;author David Boeren
;assert CORESIZE == 8000
;strategy JMZ scanner

step    equ 184                     ; modulo 8 bombing
gate    equ ptr-7

        org boot
ptr     DAT.F       #16,       #8
bomb2   MOV.I        -1,      >-1
        DAT.F       #12,       #0
kill    MOV.I     bomb2,    @targ 
targ    MOV.I     bomb1,       *0
scan    ADD.AB    #step,     targ
        JMZ.F      scan,    @targ
        JMN.B      kill,     targ
bomb1   SPL.B       #16,       #2
clear   MOV.I      @ptr,     }ptr    ; Coreclear modified from Phosphorus
        DJN.F     clear,    <gate

boot    MOV.I   clear+1,     3198    ; fast boot away tail first
for 10
        MOV.I     {boot,    <boot
rof
        ADD.AB       #5,     boot
        SPL.B     @boot,       #1    ; split to main program
        MOV.I         0,     boot    ; obliterate boot pointer

for (MAXLENGTH-CURLINE)
        DAT.F (scan*23),(targ*91)    ; big decoy to confuse scanners
rof
        END


