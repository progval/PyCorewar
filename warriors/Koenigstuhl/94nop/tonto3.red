;redcode-b
;name Tonto 3
;author Steve Bailey
;strategy DJN stream + agile code block
;assert CORESIZE==8000
;v1     29feb96 Original 
;v2     05mar96 Change jmp.f at exec to djn.f
;               Dec added to spls
;v3     22mar96 Improved constants

OFFSET  equ     872
ZAP     equ     -50

start   spl     exec,   <1111
        spl     exec,   <2222
        spl     exec,   <3333
        djn.f   #0,     <ZAP

const   dat     #const, #const+OFFSET
exec    mov.i   }const, >const
        djn.f   exec+OFFSET, <ZAP

        end     start
