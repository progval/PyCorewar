;redcode-94
;name myVamp v3.7
;author Paulsson
;strategy Throw jmp's around at 2/3c.
;strategy Then a spl/spl/dat and djn coreclear.
;strategy All in the tiny space of 14 bytes!
;strategy New constants   
;contact mpn@ifm.liu.se
;NSFCWT Round 8
;assert 1

step    equ 13808
boot    equ     13816
org     start

trap    jmp             11
i       for     10
                dat.f   0, 0
rof
                spl             #0,<trap
                spl             5,0
                spl             #0,0
                spl             #0,0
                spl             #0,0
                spl             #0,0
                spl             #0,0
                spl             #0,0
                spl             #0,0
                jmp             -4,0
                
i       for     39-16
                dat.i   #1, i
rof
start   mov.i   }ptr,>ptr
i for 13
                mov.i   }ptr,>ptr
rof
                jmp             st+boot+trap-c,1
ptr             dat.f   c2,trap+boot+c2-c

c2      spl.f   #b1, b2+2
st      add.f   s, c
                mov.i   c, @c
                jmz.a   st, *c
                mov.i   @0,*c
                mov.x   *c,*c
exit    jmz.b   st, c-boot
b1      spl     #b2-c2, b2-c2+2
                mov.i   *c2, >c2
                djn.f   -1, {c2-b2+c2-2
b3      dat.f   <55440/3, <55440/7
b2      spl     #b3-c2, b2-c2+2
c       jmp     *-boot, 0
s       dat.f   -step, step
i for 13
                dat.i   #1,1
                dat.f   1,#1
rof
