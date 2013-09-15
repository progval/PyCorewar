;redcode-lp
;author John K. Lewis
;strategy Tribble/Kline Stone.
;name skinner
;last minute adjustment, please use this instead of last entry.
;assert 1

sStep     equ    4954

paper   mov.ab  #7,#7         ;
copy    mov.i   <paper,<ptr   ;
        jmn.b   copy,paper    ;
ptr     spl.a   @ptr,5015     ; if there are free process then go to blah
Stone     mov    {1601    ,1-sStep
          sub.x  #sStep   ,-1
          jmp    -2       ,}-2

jmp     paper,paper             ; else it goes here.

