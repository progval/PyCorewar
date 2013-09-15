;redcode-b
;name Paper Eater
;author David Boeren
;assert CORESIZE == 8000
;strategy Eat Papers!
 
gate    equ ptr-7
 
        org start
ptr     DAT.B        #8,       #3
        DAT.F        #8,       #1
        SPL.B        #8,       #1
start   SPL.B        #8,       #2
clear   MOV.I      @ptr,     }ptr
        DJN.F     clear,    <gate
        END
