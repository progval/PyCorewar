;redcode-94x
;name Tinyshot
;author John Metcalf
;strategy oneshot .25c bomb, .5c scan
;assert CORESIZE==800

        f equ 36
        s equ 26
        i equ 18
        j equ 11
        d equ -79

        for   8
        dat   0,0
        rof

loop    sub   inc,   scan
        mov   bomb,  @scan
scan    sne   f+i,   *f
        djn.f loop,  <d

inc     spl   #-s,   <-s
        mov   @bptr, >scan
        mov   @bptr, >scan
        mov   @bptr, >scan
bptr    djn.f -2,    {clr

        dat   #-15,  clr-scan
clr     spl   #-15,  clr+1-scan
bomb    dat   {j,    1

        end   loop+1

