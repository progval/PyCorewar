;redcode-lp
;name BioMech
;author inversed
;strategy Evolved paper based on human technology
;strategy Uses ingenious bombing technique
;strategy Evolved with YACE
;assert (CORESIZE==8000) && (MAXPROCESSES==8)

len     equ     23
len0    equ     8
b1      equ     26
a2      equ     2696
b2      equ     2678
inc     equ     6
zofs    equ     2231

from    mov     #len,   >len0
loop    mov     <a,     }b1
a       add.x   #a2,    {b2
        mov     <from,  <to
        jmn     loop,   from
        spl     from,   }inc
to      jmn.a   @0,     zofs

