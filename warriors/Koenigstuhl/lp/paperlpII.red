;redcode-lp
;name Paper 'LP' II
;author Philip Kendall
;strategy A djn paper for the low process environment
;strategy 1 process, 7 lines per copy
;strategy More wins, more losses
;assert CORESIZE==8000
;planar paper
;show source

length  equ     (data&i-pap&i+1)
space   equ     1231

dist01  equ     883
dist02  equ     1257
dist03  equ     -573
dist04  equ     3139
dist05  equ     -2047
dist06  equ     2155
dist07  equ     3803
dist08  equ     -921

bomb01  equ     -2667           ; lots of imp numbers
bomb02  equ     -1143           ; well, why not?
bomb03  equ     -889
bomb04  equ     -5091
bomb05  equ     -3077
bomb06  equ     -2353
bomb07  equ     -7579
bomb08  equ     -381

start
i       for     7
        spl.a   copy&i,>(i*1000)
        rof
        jmp.a   copy08,>-500

        dat.a   1,1
        dat.b   1,1
        dat.ab  1,1
        dat.ba  1,1

        for     MAXLENGTH>=200  ; more decoy if we've got room
        dat.f   1,1
        dat.x   1,1
        dat.i   1,1
        dat.a   1,#1
        rof

i       for     8               ; 8 processes => 8 copies

pap&i   mov.a   #1,data&i
        mov.ab  #length,rep&i
copy&i  mov.i   {data&i,<data&i
rep&i   djn.b   copy&i,#length
        spl.a   *data&i,>bomb&i
        jmz.b   @data&i,rep&i
data&i  dat.f   1,dist&i

        dat.a   1,1
        dat.b   1,1
        dat.ab  1,1
        dat.ba  1,1

        for     MAXLENGTH>=200
        dat.f   1,1
        dat.x   1,1
        dat.i   1,1
        dat.a   #1,1
        dat.b   #1,1
        dat.ab  #1,1
        dat.ba  #1,1
        dat.f   #1,1
        dat.x   #1,1
        dat.i   #1,1
        dat.a   1,#1
        dat.b   1,#1
        rof

        rof

        end     start

