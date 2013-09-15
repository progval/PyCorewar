;redcode-lp
;author inversed
;name MicroWarp
;strategy Paper with disruptive mov {x, {x attack
;assert (CORESIZE==8000) && (MAXPROCESSES==8)

len0    equ     7
len     equ     (32+7-4)
inc     equ     (6997+70 -80)
zofs    equ     (7303+112-80)
dec     equ     (4757+28 -80)
warp    equ     (7325+26 -80)

from    mov     #len,   >len0
        add.a   #inc,   to
loop    mov     <from,  {to
        mov     {warp,  {warp
        jmn     loop,   from
        spl     from,   {dec
to      jmz     zofs,   *0

