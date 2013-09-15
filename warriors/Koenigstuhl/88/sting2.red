;redcode
;name Sting2

;assert 1
stomp    mov #0      , -1
         jmp -1
sting2   spl  stomp
loop     add #8      , cell
         jmz  loop   ,@cell
         add  sting2 ,@cell
         jmp  loop
cell     dat  #4912
         end  sting2
