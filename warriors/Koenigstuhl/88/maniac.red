;redcode
;name Maniac 1.0

;strategy launch lots of trolls :-)
;assert 1

start   sub     #256,   bomb
        mov     try+2,  <bomb
        mov     try+1,  <bomb
        mov     try+0,  <bomb
        spl     @bomb
        jmp     start

bomb    dat     #0

try     spl     <bomb
        djn     try,    cnt
cnt     dat     #32
        end
