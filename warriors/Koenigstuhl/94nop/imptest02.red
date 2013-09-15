;redcode-94
;name imptest 0.2
;version 0.2
;author Ilmari Karonen
;strategy try a new kind of imp launch
;history 0.1 - Just a continuous vector-launched imp.
;history 0.2 - Self-priming jmp/add launch.
;date October 23, 1996
;planar imp
;assert CORESIZE == 8000

        org     pump

impstep equ     7579            ; imp step
fuselen equ     190             ; imp size
point   equ     (imp+1-18*(impstep+1))  ; imp start

; *** Imp launch

pump    spl     0, >prime
prime   mov.i   imp, point-1
        add.f   #impstep+1, ptr
ptr     jmp     point-impstep-1, {pump-fuselen+3

imp     mov.i   #impstep, *0

        end

