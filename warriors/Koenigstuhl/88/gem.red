;redcode
;name GEM
;author Leonardo Furlanetto
;assert 1

src    dat #0
start  mov #(dst-src),src
       add #1000,dst
loop   mov @src,<dst
       djn loop,src
       spl @dst
       spl start
cicl   mov src,@dato
       add #5,dato
       jmp cicl
dato   dat #0
dst    dat #0
       end start
