;redcode-94x
;name musket loader v2
;author Brian Haskin
;strategy one shot for the tiny hill
;strategy got rid of one instruction and
;strategy added some core coloring
;assert 1

;musket loader v2 survived to an age of 85 on Pizza's '94x tiny hill

STEP    equ     12
DIST    equ     6

        add    inc, sk
sk      sne    8,   8+DIST
        djn.f  -2,  @sk
        add.ab sk,  ptr
        jmp    clr
inc     dat    STEP,STEP

for 20-6-8
        dat    0,   0
rof

ptr     dat    2,   sk-ptr
        dat    1,   lst-ptr+1
clr     spl    #1,  lst-ptr+1
        mov    *ptr,>ptr
        mov    *ptr,>ptr
lst     djn    -2,  >ptr
        end

