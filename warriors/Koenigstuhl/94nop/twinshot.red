;redcode-94nop
;name twinshot
;author John Metcalf
;strategy twin oneshots
;assert CORESIZE==8000

        f equ 237
        f2 equ 2731
        s equ 26
        i equ 13

loop    add   inc,   scan
scan    sne   f+i,   f
        djn.f loop,  >scan
inc     spl   #s,    {s-1
        mov   @bptr, >scan
        mov   @bptr, >scan
        mov   @bptr, >scan
bptr    djn.f -2,    {clr
        dat   0,0
        dat   0,0
        dat   #-7,  clr-2-scan
clr     spl   #-2002,clr+1-scan

        for   14
        dat   0,0
        rof

loop2   sub   inc2,  scan2
scan2   sne   f2+i,  f2
        djn.f loop2, <scan2
inc2    spl   #-s,   {-1-s
        mov   @bptr2,>scan2
        mov   @bptr2,>scan2
        mov   @bptr2,>scan2
bptr2   djn.f -2,    {clr2
        dat   0,0
        dat   0,0
        dat   #-7,  clr2-2-scan2
clr2    spl   #-2002,clr2+1-scan2

        for   53
        dat   0,0
        rof

        di equ (loop+6702)
        st equ (-104)
go
z       for   7
        mov   <di+st*(z-1)+1,<di+st*z
        rof
        spl   scan2,     {di+st*8
        jmp   scan,      {di+st*9
        end   go

