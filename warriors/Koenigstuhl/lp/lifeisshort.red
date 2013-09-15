;redcode-lp
;name life is short
;author Planar
;strategy imp,stone,pspace,paper
;
; Round 2 of the Redcode Maniacs Tournament.
; Not much better than nothing, but I have no time.
;
;assert MAXPROCESSES==8

impst   equ     (beg+250)
istep   equ     2667
sstep   equ     2234


; p-switcher: switch at every fight to throw other p-spacers
; off balance.

beg     ldp.a   #1, 1
        sub.ab  #0, #1
        stp.b   -1, #1
        jmn.b   isbeg, -2


; paper stolen from Philip Kendall's  "Paper 'LP'"

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

i       for     7
        spl.a   copy&i,>(i*1000)
        rof
        jmp.a   copy08,>-500

i       for     8               ; 8 processes => 8 copies

pap&i   mov.a   #1,data&i
        mov.ab  #length,rep&i
copy&i  mov.i   {data&i,<data&i
rep&i   djn.b   copy&i,#length
        spl.a   pap&i,}data&i
        jmp.a   @data&i,>bomb&i
data&i  dat.f   1,dist&i
        rof


; imp-stone

isbeg   spl     stone
        spl     stone
        spl     stone
        spl     stone
        mov.i   imp, impst
        spl     1
        spl     2
        jmp     *table, }0
        jmp     @table, }0

table   dat     impst+0*istep, impst+1*istep
        dat     impst+2*istep, impst+3*istep

imp     mov.i   #0, istep

for (MAXLENGTH-CURLINE-3)
        dat     0, 0
rof

stone   mov.i   <-1, 1+sstep
        add.x   #sstep, -1
        jmp     stone, {stone

        end     beg

