;redcode-94b
;name Papyrus 6
;author Justin Kao
;assert 1
;strategy Paper of course....

dist0   equ     800
dist1   equ     1240
dist2   equ     3044
bdist1  equ     215
bdist2  equ     3215

bootdist equ    4000

        mov     copy0+0,  bootdist+copy0+0
        mov     copy0+1,  bootdist+copy0+1
        mov     copy0+2,  bootdist+copy0+2
        mov     copy0+3,  bootdist+copy0+3
        mov     copy0+4,  bootdist+copy0+4
        mov     copy0+5,  bootdist+copy0+5
        mov     copy0+6,  bootdist+copy0+6
        mov     copy0+7,  bootdist+copy0+7
        mov     copy0+8,  bootdist+copy0+8

        spl     1
        spl     1
        spl     1
        spl     1

        spl     bootdist+copy0

copy0   spl     @0,     dist0
        mov     }-1,    >-1
copy1   spl     @0,     dist1
        mov     }-1,    >-1
copy2   spl     @0,     dist2
        mov     }-1,    >-1
        mov     bomb,   }bdist1
        mov     bomb,   >bdist2
bomb    dat     <2667,  {1

        end
