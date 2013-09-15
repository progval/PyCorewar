;redcode-94x
;name tiny clear/imp
;author John Metcalf
;strategy d-clear/imp spiral
;assert CORESIZE==800

        org   start

ptr:    dat   150,    0

        dat   0,0

clear:  spl   #400,   <ptr
loop:   mov   bomb,   }ptr
        mov   bomb,   }ptr
        djn.f loop,   }ptr
bomb:   dat   7,      {1

        for   3
        dat   0,0
        rof

        iStep   equ 267     ; 3-point

        spl   #clear,       imp+iStep*6 ; 7, 6
        spl   #imp+iStep*5, imp+iStep*4 ; 5, 4
        spl   #imp+iStep*3, imp+iStep*2 ; 3, 2
imp:    mov.i #iStep,       *0          ; 1, 0

start:  spl   clear,  <-325
        spl   1,      >-347
        spl   1,      {-369
        spl   2,      }-391
        djn.a @imp,   #1
        djn.a *imp,   #1
        end

