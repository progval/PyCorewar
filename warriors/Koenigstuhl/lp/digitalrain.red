;redcode-lp
;author inversed
;name Digital Rain
;strategy Bombing paper
;assert (CORESIZE==8000) && (MAXPROCESSES==8)

;----Replication----
l       equ     25
zofs    equ     1971

;------Bombing------
bo1     equ     2638
bo2     equ     2649
color   equ     4001

from    mov     #l,     #0
loop    mov     {bo1,   {bo2
        add     {0,     }0
        mov     <from,  {to
        jmn     loop,   from
        spl     >from,  }color
to      jmz     zofs,   *0

