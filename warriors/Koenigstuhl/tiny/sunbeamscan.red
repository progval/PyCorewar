;redcode-94x
;name Sunbeam Scan
;author Simon Wainwright
;strategy scanner RF10
;assert CORESIZE==800

        step          equ         130
        gap           equ           5
        gate          equ      scan-5

scan    mov        squash,      >gate
        mov        squash,      >gate
ptr     seq     }step+gap,      }step
        mov.ab        ptr,      @scan
        add        squash,        ptr
        djn          scan,        #79

squash  spl         #step,      }step
clear   mov          wipe,      >gate
        djn.f       clear,      >gate

wipe    dat          <267,         17
        end         ptr+1

