;redcode-94x
;name imp-clearer
;author Will 'Varfar'
;strategy throw some imps, and be an almost-perfect gate
;assert 1

        gate    equ     (throw-10)
        n       equ     4
        
throw   mov     imp,    MINDISTANCE
        add     #n,     throw
        djn     throw,  #((CORESIZE-(MINDISTANCE*2))/n)
wimp    jmp     #0,     >gate
imp     mov.i   #0,     1
        end
