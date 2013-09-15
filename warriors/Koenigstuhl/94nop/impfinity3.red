;redcode-94b
;name Impfinity v3c11
;author Planar
;strategy spiral + stone
;assert CORESIZE == 8000

isize   equ     11
istep   equ     5091

idist   equ     (8000/isize)
bstep   equ     948
trash   equ     30

impoff  equ     200
prmpos  equ     -13
gunpos  equ     (55)
stnpos  equ     90
stnflag equ     1
decflag equ     1

prmoff  equ     (impoff+prmpos)
gunoff  equ     ((idist+gunpos)/4*4+prmoff)
stnoff  equ     ((idist*2+stnpos)/4*4+prmoff)

imp     equ     (boot+impoff)

        org     boot

boot    mov.i   {pgun, <pgun
        mov.i   {pgun, <pgun
        mov.i   {pgun, <pgun

        mov.i   {pprm, <pprm
        spl     @pgun, >-trash
        mov.i   {pprm, <pprm
        spl     @pprm, >-2*trash
        mov.i   {pprm, <pprm

        mov.i   >-3*trash, pprm
        mov.i   >-4*trash, pgun

        mov.i   {pstn, <pstn
        mov.i   {pstn, <pstn
        mov.i   {pstn, <pstn
        mov.i   {pstn, <pstn
        for     stnflag
        spl     @pstn, >-5*trash
        rof
        for     1-stnflag
        mov     #0, #0
        rof

        mov.i   bomb, <pstn
        mov.i   >-6*trash, pstn

bomb    dat     <2667, <5334
pgun    dat     ptr+1, ptr+1+gunoff

gun     spl     #1, >3*trash
        add.a   #istep+1, ptr
ptr     djn.f   imp-gunoff-istep-1, <gun-1

pprm    dat     prime+2, prime+2+prmoff

instr   mov.i   #1, istep
prime   spl     #imp-prmoff, >3*trash
        mov.i   instr, }prime

pstn    dat     jump+1, jump+1+stnoff

djstr   equ     jump+((4000/idist*idist-stnpos-prmpos+(boot-jump)-20)/4*4+1)
stone   spl     #0, <pstn+bstep
loop    mov.i   pstn, @stone
        add.ab  #bstep, stone
jump    djn.f   loop, <djstr

blank   equ     jump+1

        for     decflag
ii      for     (MAXLENGTH-CURLINE)/3
        dat     1, 1
        dat     ii, 1
        dat     1, -ii
        rof
        for     MAXLENGTH-CURLINE
        dat     1, 1
        rof
        rof
