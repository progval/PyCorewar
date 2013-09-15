;redcode-94nop
;name Dark Energy
;author F^2
;strategy four stage scanner
;strategy F^2 are FatalC and Fizmo

;assert CORESIZE == 8000

; stage 1 = 2/3c scan
; stage 2 = 2/4c scan + 1/4c single spl clear
; stage 3 = 2/5c scan + 2/5c double spl clear
; stage 4 = dat clear

;       created with a little help
;       from everyone in #COREWARS

        org     wipe
step    equ     1807
offset  equ     4644
sep     equ     8
tail    equ     5737
count   equ     399

toofar  nop     }wipe       ,    }speedup
target  mov.x   #offset     ,    #tail
        mov.ba  shades      ,    target
wipe    mov     slow        ,    >target
        mov     slow        ,    }target
loop    add     inc         ,    shades
shades  seq     }offset+sep ,    offset
        djn.a   {toofar     ,    speedup
speedup djn     loop        ,    #count
inc     spl     #step       ,    }step
clear   mov     cleanup     ,    >clear-13
        djn.f   clear       ,    >clear-13
cleanup dat     1           ,    17
slow    spl     #1          ,    1
        end

